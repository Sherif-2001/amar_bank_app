import 'package:amar_bank_app/models/exchange_rate.dart';
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

  Future<void> transferMoney(
      int amountOfMoney, String userToTransferCardNum) async {
    final currentUserData = await getCurrentUserData();

    QuerySnapshot querySnapshot =
        await _firebaseFirestore.collection("Users").get();

    final userData = querySnapshot.docs.firstWhere((element) =>
        UserData.fromJson(element.data() as Map<String, dynamic>).cardNum ==
        userToTransferCardNum);

    if (userData.exists) {
      DocumentReference currentUserDoc = FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserData.cardNum);

      DocumentReference otherUserDoc = FirebaseFirestore.instance
          .collection("Users")
          .doc(userToTransferCardNum);

      await currentUserDoc
          .update({"Balance": FieldValue.increment(-amountOfMoney)});
      await otherUserDoc
          .update({"Balance": FieldValue.increment(amountOfMoney)});
    }
  }
}
