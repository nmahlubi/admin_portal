import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../../locator.dart';

class FirebaseRepo {
  var _firebaseAuth = locator<FirebaseAuth>();

  Future<User> getCurrentUser() async{
    User user = _firebaseAuth.currentUser;
    return user;
  }
  
  Future<bool> isEmailVerified() async{

    User user = _firebaseAuth.currentUser;
    return user.emailVerified;
  }

  Future<void> sendEmailVerification() async{

    User user = _firebaseAuth.currentUser;

    return user.sendEmailVerification();
  }

  Future<String> signIn(String email, String password,) async{

    UserCredential authResult;
    try {
    authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return authResult.user.uid;
    } catch(error) {
      return Future.error(getError(error));
    }
  }
  
  Future<void> signOut() {

    return _firebaseAuth.signOut();
  }

  Future<String> signUp(String email, String password,) async{

    UserCredential authResult;
    try {
    authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password,);
    return authResult.user.uid;
    } catch(error) {
      return Future.error(getError(error));
    }
  }

  Future<User> signUpWithCredential(AuthCredential credential) async{

    UserCredential authResult;
    try {
    authResult = await _firebaseAuth.signInWithCredential(credential);
    return authResult.user;
    } catch(error) {
      return Future.error(getError(error));
    }
  }

  Future<void> sendPasswordResetEmail(String email) async{
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return;
    } catch(error) {
      return Future.error(getError(error));
    }
  }

  Future<String> getUserToken() async{
    User user;
    String tokenResult;
    try {
      user = await getCurrentUser();
      tokenResult = await user.getIdToken(false);
      return tokenResult;
    } catch(error) {
      return Future.error(getError(error));
    }
  }

  String getError(error) {
    String errorMessage;
    if(error is PlatformException) {
      switch ((error ).code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Please enter your correct email address.";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Please enter the correct password.";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage =
          "This email address does not exist. Please enter correct email address.";
          break;
        case "ERROR_USER_DISABLED":
          errorMessage =
          "This profile no longer exists. Please contact support.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage = "Too many requests. Try again later.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Anonymous accounts are not enabled";
          break;
        case "ERROR_WEAK_PASSWORD":
          errorMessage = "Your password is too weak";
          break;
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Please enter your correct email.";
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          errorMessage = "This email already exists.";
          break;
        case "ERROR_INVALID_CREDENTIAL":
          errorMessage = "Please enter your correct email.";
          break;

        default:
          errorMessage = error?.message != null
              ? error?.message?.toString()
              : "An undefined Error happened.";
      }
    } else {
      errorMessage = error?.message != null
          ? error?.message?.toString()
          : "${error.toString()}";
    }
    return errorMessage;
  }
}