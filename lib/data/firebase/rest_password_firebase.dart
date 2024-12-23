import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../errors/errors.dart';
import 'rest_password_abstract.dart';

class RestPasswordFirebaseService extends RestPasswordAbstract {
  @override
  Future<Either<AuthError, void>> sendResetPasswordEmail(
      {String? email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(AuthError.fromFirebaseAuthException(e));
    }
  }

  @override
  Future<Either<AuthError, void>> resetPasswordWithOldPassword(
      {String? password, String? newPassword}) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var credentials = EmailAuthProvider.credential(
          email: user!.email!, password: password!);
      await user.reauthenticateWithCredential(credentials);
      await user.updatePassword(newPassword!);
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(AuthError.fromFirebaseAuthException(e));
    }
  }
}
