import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_e/helpers/di_helper.dart';

class RegisterPageController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void registerANewUser({Function? onSuccess, Function? onError}) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final result =
          await DIHelper.instance.authService.signUpWithEmailAndPassword(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
      );

      result.fold(
        (l) => onError?.call(l.errorMessage),
        (r) {
          // if registration is successful, navigate to the address setup page

          return onSuccess?.call();
        },
      );
    } else {
      onError?.call("unknown error");
    }
  }
}
