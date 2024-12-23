import 'package:flutter/material.dart';

import '../helpers/di_helper.dart';

class LoginPageController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //
  ValueNotifier<bool> isObscure = ValueNotifier(true);
// TextEditingController for email and password
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  void login({Function? onSuccess, Function(String)? onError}) async {
    if (formKey.currentState!.validate()) {
      // Add your login logic here
      (await DIHelper.instance.authService.signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text))
          .fold((l) {
        onError?.call(l.errorMessage);
      }, (r) {
        onSuccess?.call();
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    isObscure.dispose();
    super.dispose();
  }
}
