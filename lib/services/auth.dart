import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String uid;
  User({required this.uid});
}

class AuthBase {
  static User _userFromFirebase(User? firebaseUser) {
    if (firebaseUser != null) {
      return User(uid: firebaseUser.uid);
    } else {
      throw Exception("User is null");
    }
  }

  static Future<User> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(authResult.user as User?);
    } catch (e) {
      print("Error during registration: $e");
      rethrow;
    }
  }

  static Future<User> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(authResult.user as User?);
    } catch (e) {
      print("Error during sign in: $e");
      rethrow;
    }
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  //static loginWithEmailAndPassword(String email, String password) {}
}
