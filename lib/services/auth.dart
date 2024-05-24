import 'package:amar_bank_app/services/database_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signInWithCardNumAndPassword(
      {required String cardNum, required String password}) async {
    if (await DatabaseHelper().isCardNumUserExist(cardNum)) {
      await DatabaseHelper().getUserDataByCardNum(cardNum).then((data) =>
          signInWithEmailAndPassword(email: data.email, password: password));
    }
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<bool> forgetPassword(
      {required String cardNum,
      required String nationalId,
      required String cardPin,
      required String expDate}) async {
    final user = await DatabaseHelper().getUserDataByCardNum(cardNum);
    if (user != null &&
        user.nationalId == nationalId &&
        user.cardPin == cardPin &&
        user.expiryDate == expDate) {
      await signInWithEmailAndPassword(
          email: user.email, password: user.password);
      return true;
    }
    return false;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
