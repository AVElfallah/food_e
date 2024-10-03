import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';

import '../../../helpers/colors_helper.dart';
import '../../../helpers/router_helper.dart';
import '../../../shared/widgets/role_model_appbar_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = context.textTheme.labelSmall?.copyWith(
      color: ColorsHelper.primary,
    );
    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Register',
              style: context.textTheme.headlineLarge,
            ),
          ),
          SizedBox(height: context.height * .08),
          // start full name textfrom
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
            ),
            child: Text(
              'full name',
              style: labelTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'John Doe',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),

          ///end full name textform
          // start email textfrom
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 20),
            child: Text(
              'email',
              style: labelTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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

          ///end email textform
          // start email textfrom
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 20),
            child: Text(
              'phone',
              style: labelTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: '+00 123 456 7890',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),

          ///end phone textform

          ///start password textfrom
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 20),
            child: Text(
              'password',
              style: labelTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextFormField(
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: '********',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility,
                    color: ColorsHelper.primary,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          // end password textform
          const SizedBox(
            height: 20,
          ),
          //start register button
          Center(
            child: ElevatedButton(
              onPressed: () {
                //TODO - add register feature here
                Navigator.of(context).pushReplacementNamed(
                  RouterHelper.addressSetupPage,
                );
              },
              child: const Text(
                'Register',
              ),
            ),
          ),
          //end register button
          const SizedBox(
            height: 20,
          ),
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
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
