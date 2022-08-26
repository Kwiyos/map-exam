import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository{
  Future<bool> loadLogin(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      return credential.user != null;
    } on FirebaseAuthException catch (e) {
      return false;
    } catch (e) {
      return false;
    }
  }
}