import 'package:amar_bank_app/models/exchange_rate.dart';
import 'package:amar_bank_app/models/product.dart';
import 'package:amar_bank_app/models/transfer.dart';
import 'package:amar_bank_app/models/user_data.dart';
import 'package:amar_bank_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> createUserInDatabase(
      {required String cardNum, required UserData userData}) async {
    DocumentReference documentReference =
        _firebaseFirestore.collection("Users").doc(cardNum);
    await documentReference.set(userData.toJson());
  }

  Future<List<ExchangeRate>> getCurrenciesData() async {
    QuerySnapshot querySnapshot =
        await _firebaseFirestore.collection("Currencies").get();

    final currenciesData = querySnapshot.docs
        .map((doc) => ExchangeRate.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return currenciesData;
  }

  Future<bool> isCardNumUserExist(String cardNum) async {
    QuerySnapshot querySnapshot =
        await _firebaseFirestore.collection("Users").get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      if (doc.id == cardNum) {
        return true;
      }
    }
    return false;
  }

  Future<UserData> getUserDataByCardNum(String cardNum) async {
    QuerySnapshot querySnapshot =
        await _firebaseFirestore.collection("Users").get();

    final userData =
        querySnapshot.docs.firstWhere((element) => element.id == cardNum);

    final user = UserData.fromJson(userData.data() as Map<String, dynamic>);
    return user;
  }

  Future<UserData> getCurrentUserData() async {
    QuerySnapshot querySnapshot =
        await _firebaseFirestore.collection("Users").get();

    final userData = querySnapshot.docs.firstWhere((element) =>
        UserData.fromJson(element.data() as Map<String, dynamic>).email ==
        Auth().currentUser!.email);

    final user = UserData.fromJson(userData.data() as Map<String, dynamic>);
    return user;
  }

  Future<void> payBill(int billPrice) async {
    final currentUserData = await getCurrentUserData();

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUserData.cardNum);

    documentReference.update({"Balance": FieldValue.increment(-billPrice)});
  }

  Future<void> transferMoney(int amountOfMoney, String receiverCardNum) async {
    final senderUserData = await getCurrentUserData();
    final receiverUserData = await getUserDataByCardNum(receiverCardNum);

    QuerySnapshot querySnapshot =
        await _firebaseFirestore.collection("Users").get();

    final userData = querySnapshot.docs.firstWhere((element) =>
        UserData.fromJson(element.data() as Map<String, dynamic>).cardNum ==
        receiverCardNum);

    if (userData.exists) {
      DocumentReference senderUserDoc = FirebaseFirestore.instance
          .collection("Users")
          .doc(senderUserData.cardNum);

      DocumentReference receiverUserDoc =
          FirebaseFirestore.instance.collection("Users").doc(receiverCardNum);

      // Change the amount of money in both accounts
      await senderUserDoc
          .update({"Balance": FieldValue.increment(-amountOfMoney)});
      await receiverUserDoc
          .update({"Balance": FieldValue.increment(amountOfMoney)});

      final transferOperation = Transfer(
          amountOfMoney: amountOfMoney,
          receiverCardNumber: receiverUserData.cardNum,
          senderCardNumber: senderUserData.cardNum,
          time: Timestamp.now());

      final List<Transfer> senderUpdatedTransitions = senderUserData.transfers;
      senderUpdatedTransitions.add(transferOperation);

      await senderUserDoc.update({
        "Transfers":
            senderUpdatedTransitions.map((item) => item.toJson()).toList()
      });

      final List<Transfer> receiverUpdatedTransitions =
          receiverUserData.transfers;
      receiverUpdatedTransitions.add(transferOperation);

      await receiverUserDoc.update({
        "Transfers":
            receiverUpdatedTransitions.map((item) => item.toJson()).toList()
      });
    }
  }

  Future<void> applyForProduct(
      int amountOfMoney, String type, String nameOfProduct) async {
    final userData = await getCurrentUserData();
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection("Users").doc(userData.cardNum);

    final transferOperation = Product(
        amountOfMoney: amountOfMoney.toString(),
        type: type,
        nameOfProduct: nameOfProduct,
        time: Timestamp.now());

    final List<Product> updatedProducts = userData.products;
    updatedProducts.add(transferOperation);

    await payBill(amountOfMoney);

    await userDoc.update(
        {"Products": updatedProducts.map((item) => item.toJson()).toList()});
  }
}
