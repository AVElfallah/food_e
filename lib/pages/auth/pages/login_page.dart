import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';

import '../../../shared/widgets/role_model_appbar_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
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
              decoration: InputDecoration(
                hintText: 'johndoe@email.com',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
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
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility,
                    color: ColorsHelper.primary,
                  ),
                ),
                hintText: 'password',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
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
          const SizedBox(
            height: 20,
          ),
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
          const SizedBox(
            height: 20,
          ),
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
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
