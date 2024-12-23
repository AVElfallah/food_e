import 'package:fpdart/fpdart.dart';

import '../../errors/errors.dart';

abstract class RestPasswordAbstract {
  Future<Either<AuthError, void>> sendResetPasswordEmail({String? email});

  Future<Either<AuthError, void>> resetPasswordWithOldPassword(
      {String? password, String? newPassword});
}
