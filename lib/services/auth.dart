import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anon
  Future signInAnon() async {
    // try {
    //   AuthResult result = await _auth.signInAnonymously();
    //   FirebaseUser user = result.user;
    //   print(user);
    //   return user;
    // } catch (e) {
    //   print(e.toString());
    //   return null;
    // }
  }

  //register with email & password
Future signUpWithEmailAndPassword({email, password}) async {
  try {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password)).user;
    await user.sendEmailVerification();

    if (user != null) {
      return user;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

  //sign in with email & password
  Future login ({@required email, @required password}) async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
          email: email,
          password: password)).user;
      await user.sendEmailVerification();

      if (user != null) {
        return user;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //sign out

}
