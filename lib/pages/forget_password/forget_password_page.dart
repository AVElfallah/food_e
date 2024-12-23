import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/extensions/widget_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/shared/widgets/loader_widget.dart';
import 'package:food_e/shared/widgets/role_model_appbar_widget.dart';
import 'package:food_e/shared/widgets/show_error_snackbar.dart';

import '../../controllers/riverpod_objects/riverpod_objects.dart';
import '../../shared/constants/constant_sizedboxes.dart';
import '../auth/methods/register_validation.dart';

class ForgetPasswordPage extends ConsumerWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var forgetPasswordProvider = ref.watch(forgetPasswordPageController);

    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: Form(
        key: forgetPasswordProvider.formKey,
        child: ListView(
          children: [
            Text(
              'forgot password',
              style: context.textTheme.headlineLarge,
            ).padding(15),
            Text(
              'We’ll send a password reset link to your email.',
              style: context.textTheme.bodyMedium?.copyWith(
                color: ColorsHelper.gray,
              ),
            ).paddingSymmetric(horizontal: 15),
            SizedBox(
              height: context.height * .25,
            ),
            Text(
              'email',
              style: context.textTheme.labelSmall?.copyWith(
                color: ColorsHelper.primary,
              ),
            ).paddingOnly(left: 30),
            TextFormField(
              controller: forgetPasswordProvider.emailController,
              validator: emailValidator,
              style:
                  context.textTheme.bodyMedium!.copyWith(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'johndoe@email.com',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ).paddingSymmetric(horizontal: 15),
            h20SizedBox,
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showLoader(context);
                  forgetPasswordProvider.sendResetPasswordLink(onSuccess: () {
                    hideLoader();
                    Navigator.of(context).pushNamed(RouterHelper.emailSentPage);
                  }, onError: (error) {
                    hideLoader();
                    showErrorSnackBar(context, error);
                  });
                },
                child: const Text(
                  'Login',
                ),
              ),
            ),
            h20SizedBox,
            h40SizedBox,
          ],
        ),
      ),
    );
  }
}
