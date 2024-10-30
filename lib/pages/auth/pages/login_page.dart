import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/shared/constants/constant_sizedboxes.dart';

import '../../../shared/widgets/role_model_appbar_widget.dart';
import '../methods/input_decoration.dart';
import '../../../shared/constants/constant_padding.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: ListView(
        children: [
          Padding(
            padding: pad15All,
            child: Text(
              'Login',
              style: context.textTheme.headlineLarge,
            ),
          ),
          SizedBox(
            height: context.height * .25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              'email',
              style: context.textTheme.labelSmall?.copyWith(
                color: ColorsHelper.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
              ),
              decoration: CustomInputDecoration.basicTextFormField(
                context,
                hintText: 'johndoe@email.com',
              ),
            ),
          ),
          h20SizedBox,
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              'Password',
              style: context.textTheme.labelSmall?.copyWith(
                color: ColorsHelper.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
              ),
              decoration: CustomInputDecoration.password(
                context,
                hintText: '********',
              ),
            ),
          ),
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
                //TODO - add login feature here
                Navigator.of(context)
                    .pushReplacementNamed(RouterHelper.homePage);
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
    );
  }
}
