import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_e/data/firebase/auth_abstract.dart';
import 'package:fpdart/fpdart.dart';

import '../../errors/errors.dart';

class AuthFirebaseService extends Auth<FirebaseAuth> {
  @override
  FirebaseAuth get authService => FirebaseAuth.instance;

  @override
  Future<Either<AuthError, void>> signInWithEmailAndPassword(
      {String? email, String? password}) async {
    try {
      var credentials = await authService.signInWithEmailAndPassword(
          email: email!, password: password!);
      if (credentials.user != null) {
        return right(null);
      } else {
        return left(AuthError('User not found'));
      }
    } on FirebaseAuthException catch (e) {
      return left(AuthError.fromFirebaseAuthException(e));
    }
  }

  @override
  Future<Either<AuthError, bool>> signUpWithEmailAndPassword({
    String? email,
    String? password,
    String? phone,
    String? name,
  }) async {
    try {
      var credentials = await authService.createUserWithEmailAndPassword(
          email: email!, password: password!);
      credentials.user!.updateDisplayName(name);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(credentials.user!.uid)
          .set({
        "email": email,
        "phone": phone,
        "name": name,
      });

      return right(true);
    } on FirebaseAuthException catch (e) {
      return left(AuthError.fromFirebaseAuthException(e));
    }
  }

  @override
  Future<Either<AuthError, void>> signOut() async {
    try {
      await authService.signOut();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(AuthError.fromFirebaseAuthException(e));
    }
  }
}
