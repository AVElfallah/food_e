import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/shared/widgets/role_model_appbar_widget.dart';

import '../../shared/constants/constant_sizedboxes.dart';
import '../../../shared/constants/constant_padding.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: ListView(
        children: [
          Padding(
            padding: pad15All,
            child: Text(
              'forgot password',
              style: context.textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'We’ll send a password reset link to your email.',
              style: context.textTheme.bodyMedium?.copyWith(
                color: ColorsHelper.gray,
              ),
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
            ),
          ),
          h20SizedBox,
          Center(
            child: ElevatedButton(
              onPressed: () {
                //TODO - add forgetpassword feature
                Navigator.of(context).pushNamed(RouterHelper.emailSentPage);
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
    );
  }
}
