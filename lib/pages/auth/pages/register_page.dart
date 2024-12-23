import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/extensions/widget_extension.dart';
import 'package:food_e/pages/auth/methods/input_decoration.dart';
import 'package:food_e/shared/constants/constant_sizedboxes.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../helpers/colors_helper.dart';
import '../../../helpers/router_helper.dart';
import '../../../shared/constants/constant_padding.dart';

import '../../../shared/widgets/role_model_appbar_widget.dart';
import 'package:food_e/controllers/riverpod_objects/riverpod_objects.dart';

import '../methods/register_validation.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final labelTextStyle = context.textTheme.labelSmall?.copyWith(
      color: ColorsHelper.primary,
    );
    bool isPasswordVisible = false;

    var readProvider = ref.read(registerPageController);
    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: Form(
        key: readProvider.formKey,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register',
                style: context.textTheme.headlineLarge,
              ).paddingWithCustomEdgeInsets(pad15All),
              SizedBox(height: context.height * .08),
              // start full name textfrom
              Text(
                'full name',
                style: labelTextStyle,
              ).paddingOnly(
                left: 35,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: fullNameValidator,
                controller: readProvider.nameController,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
                decoration: CustomInputDecoration.basicTextFormField(
                  context,
                  hintText: 'John Doe',
                ),
              ).paddingSymmetric(horizontal: 20),

              ///end full name textform
              // start email textfrom
              Text(
                'email',
                style: labelTextStyle,
              ).paddingOnly(left: 35, top: 20),

              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: emailValidator,
                controller: readProvider.emailController,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
                decoration: CustomInputDecoration.basicTextFormField(
                  context,
                  hintText: 'johndoe@email.com',
                ),
              ).paddingSymmetric(horizontal: 20),

              ///end email textform
              // start email textfrom
              Text(
                'phone',
                style: labelTextStyle,
              ).paddingOnly(left: 35, top: 20),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: phoneValidator,
                controller: readProvider.phoneController,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
                decoration: CustomInputDecoration.basicTextFormField(
                  context,
                  hintText: '+00 123 456 7890',
                ),
              ).paddingSymmetric(horizontal: 20),

              ///end phone textform

              ///start password textfrom
              Text(
                'password',
                style: labelTextStyle,
              ).paddingOnly(left: 35, top: 20),
              StatefulBuilder(builder: (context, changeState) {
                return TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: passwordValidator,
                  controller: readProvider.passwordController,
                  obscureText: !isPasswordVisible,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  ),
                  decoration: CustomInputDecoration.password(context,
                      hintText: '********', onPasswordIconPressed: () {
                    // Change password visibility
                    changeState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  }),
                ).paddingSymmetric(horizontal: 20);
              }),
              // end password textform
              h20SizedBox,
              //start register button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    readProvider.registerANewUser(
                      onSuccess: () {
                        // if registration is successful, navigate to the address setup page
                        Navigator.of(context).pushReplacementNamed(
                          RouterHelper.addressSetupPage,
                        );
                      },
                      onError: (String? error) {
                        // if registration is not successful, show an error message
                        showTopSnackBar(Overlay.of(context),
                            CustomSnackBar.error(message: error ?? ''));
                      },
                    );
                  },
                  child: const Text(
                    'Register',
                  ),
                ),
              ),
              //end register button
              h20SizedBox,
              // have an account button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: ColorsHelper.gray,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                        RouterHelper.loginPage,
                      );
                    },
                    child: Text(
                      'Login',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: ColorsHelper.secondary,
                      ),
                    ),
                  ),
                ],
              ),
              //end have an account button
              h40SizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
