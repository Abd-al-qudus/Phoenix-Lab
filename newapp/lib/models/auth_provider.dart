import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'package:newapp/models/database_provider.dart';
import 'package:newapp/models/user.dart';

class AuthenticationProvider {
  final dbProvider = DatabaseProvider();
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid, email: user.email!);
  }

  Stream<User?>? get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((response) {
        return 'success';
      });
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email';
      }
    } catch (e) {
      return e;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((response) async {
        return await dbProvider.saveUserId(email, response.user!.uid).then((_) {
          return 'success';
        });
      });
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Weak password, please change.';
      } else if (e.code == 'user-not-found') {
        return 'The specified user does not exist';
      } else {
        return e.toString();
      }
    } catch (e) {
      return e;
    }
  }

  Future logOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return e;
    }
  }
}
