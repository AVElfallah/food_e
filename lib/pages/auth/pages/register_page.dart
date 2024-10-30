import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/pages/auth/methods/input_decoration.dart';
import 'package:food_e/shared/constants/constant_sizedboxes.dart';

import '../../../helpers/colors_helper.dart';
import '../../../helpers/router_helper.dart';
import '../../../shared/constants/constant_padding.dart';

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
            padding: pad15All,
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
              decoration: CustomInputDecoration.basicTextFormField(
                context,
                hintText: 'John Doe',
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
              decoration: CustomInputDecoration.basicTextFormField(
                context,
                hintText: 'johndoe@email.com',
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
              decoration: CustomInputDecoration.basicTextFormField(
                context,
                hintText: '+00 123 456 7890',
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
              decoration: CustomInputDecoration.password(
                context,
                hintText: '********',
              ),
            ),
          ),
          // end password textform
          h20SizedBox,
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
    );
  }
}
