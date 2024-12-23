import 'package:flutter/material.dart';
import 'package:food_e/helpers/di_helper.dart';

class ForgetPasswordPageController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //
  TextEditingController emailController = TextEditingController();
  //

  void sendResetPasswordLink(
      {Function? onSuccess, Function(String?)? onError}) async {
    if (formKey.currentState!.validate()) {
      (await DIHelper.instance.restPasswordService
              .sendResetPasswordEmail(email: emailController.text))
          .fold(
        (l) {
          onError?.call(l.errorMessage);
        },
        (r) {
          onSuccess?.call();
        },
      );
    } else {
      onError?.call('Please fill all fields');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
