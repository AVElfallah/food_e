import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/extensions/widget_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/pages/auth/methods/register_validation.dart';
import 'package:food_e/shared/constants/constant_sizedboxes.dart';
import 'package:food_e/shared/widgets/loader_widget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../controllers/riverpod_objects/riverpod_objects.dart';
import '../../../shared/widgets/role_model_appbar_widget.dart';
import '../methods/input_decoration.dart';
import '../../../shared/constants/constant_padding.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var loginPageProvider = ref.watch(loginPageController);
    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: Form(
        key: loginPageProvider.formKey,
        child: ListView(
          children: [
            // Login text
            Text(
              'Login',
              style: context.textTheme.headlineLarge,
            ).paddingWithCustomEdgeInsets(pad15All),
            SizedBox(
              height: context.height * .25,
            ),
            // Email Section
            Text(
              'email',
              style: context.textTheme.labelSmall?.copyWith(
                color: ColorsHelper.primary,
              ),
            ).paddingOnly(
              left: 35,
            ),
            TextFormField(
              controller: loginPageProvider.emailController,
              validator: emailValidator,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
              ),
              decoration: CustomInputDecoration.basicTextFormField(
                context,
                hintText: 'johndoe@email.com',
              ),
            ).paddingSymmetric(horizontal: 15),
            h20SizedBox,
            //
            //

            // Password Section
            Text(
              'Password',
              style: context.textTheme.labelSmall?.copyWith(
                color: ColorsHelper.primary,
              ),
            ).paddingOnly(
              left: 35,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: loginPageProvider.isObscure,
              builder: (context, value, child) => TextFormField(
                controller: loginPageProvider.passwordController,
                obscureText: loginPageProvider.isObscure.value,
                validator: passwordValidator,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
                decoration: CustomInputDecoration.password(
                  onPasswordIconPressed: () {
                    loginPageProvider.toggleObscure();
                  },
                  context,
                  hintText: '********',
                ),
              ).paddingSymmetric(horizontal: 15),
            ),
            //
            //
            //Forget password [TextButton Widget] that navigate to forget password page
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  //Navigate to forget password
                  Navigator.of(context)
                      .pushNamed(RouterHelper.forgetPasswordPage);
                },
                child: Text(
                  'Forgot Password',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: ColorsHelper.gray,
                  ),
                ),
              ),
            ),
            h20SizedBox,
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showLoader(context);
                  loginPageProvider.login(
                    onSuccess: () {
                      hideLoader();
                      Navigator.of(context)
                          .pushReplacementNamed(RouterHelper.homePage);
                    },
                    onError: (String? error) {
                      hideLoader();
                      showTopSnackBar(Overlay.of(context),
                          CustomSnackBar.error(message: error ?? ''));
                    },
                  );
                },
                child: const Text(
                  'Login',
                ),
              ),
            ),
            h20SizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: ColorsHelper.gray,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RouterHelper.registerPage);
                  },
                  child: Text(
                    'Register',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: ColorsHelper.secondary,
                    ),
                  ),
                ),
              ],
            ),
            h40SizedBox,
          ],
        ),
      ),
    );
  }
}
