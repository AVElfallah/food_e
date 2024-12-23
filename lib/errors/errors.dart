import 'package:firebase_auth/firebase_auth.dart';

abstract class AppErrors<T> {
  final String errorMessage;
  final T? errorParms;

  AppErrors(this.errorMessage, this.errorParms);
}

class AuthError<T> extends AppErrors<T> {
  AuthError(super.errorMessage, [super.errorParms]);

  // Auth Error from Firebase Auth Exception
  factory AuthError.fromFirebaseAuthException(FirebaseAuthException e,
      {T? errorParms}) {
    if (e.code == 'email-already-in-use') {
      return AuthError(
        'Email already in use , please try another email',
        errorParms,
      );
    } else if (e.code == 'invalid-email') {
      return AuthError(
        'Invalid email address , use another email',
        errorParms,
      );
    } else if (e.code == 'weak-password') {
      return AuthError(
        'Weak password , please use a strong password',
        errorParms,
      );
    } else if (e.code == 'user-not-found') {
      return AuthError(
        'User not found , please sign up',
        errorParms,
      );
    } else if (e.code == 'wrong-password') {
      return AuthError(
        'Wrong password , please try again',
        errorParms,
      );
    } else if (e.code == 'user-disabled') {
      return AuthError(
        'User disabled , please contact support',
        errorParms,
      );
    } else if (e.code == 'too-many-requests') {
      return AuthError(
        'Too many requests , please try again later',
        errorParms,
      );
    } else if (e.code == 'network-request-failed') {
      return AuthError(
        'Network request failed , please try again later or check your internet connection',
        errorParms,
      );
    } else if (e.code == 'operation-not-allowed') {
      return AuthError(
        'Operation not allowed , please try again later',
        errorParms,
      );
    } else if (e.code == 'account-exists-with-different-credential') {
      return AuthError(
        'Account exists with different credential , please try again',
        errorParms,
      );
    }
    return AuthError(
      e.code,
      errorParms,
    );
  }
}
