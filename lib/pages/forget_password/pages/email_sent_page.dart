import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/shared/constants/constant_sizedboxes.dart';

import '../../../shared/widgets/role_model_appbar_widget.dart';
import '../../../shared/constants/constant_padding.dart';

class EmailSentPage extends StatelessWidget {
  const EmailSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: ListView(
        children: [
          Padding(
            padding: pad15All,
            child: Text(
              'Email sent',
              style: context.textTheme.headlineLarge!,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: RichText(
              text: TextSpan(
                text: "we've sent you an email at ",
                style: context.textTheme.bodyMedium,
                children: const [
                  TextSpan(
                    text: 'johndoe@email.com\n',
                    style: TextStyle(
                      color: ColorsHelper.primary,
                    ),
                  ),
                  TextSpan(
                    text:
                        'for verification. Check your email for the verification link.',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: context.height * .35),
          //start Timer counter
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '0:38',
              style: TextStyle(
                color: ColorsHelper.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //end
          h40SizedBox,

          // Text received email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Did not receive the email yet?',
              style: context.textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Resend',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: ColorsHelper.primary,
                  ),
                ),
              ),
            ),
          ),
          //end email

          h30SizedBox,

          //
          Center(
            child: ElevatedButton(
              onPressed: () {
                //TODO - add open email app

                Navigator.of(context).pushReplacementNamed(
                  RouterHelper.resetPasswordPage,
                );
              },
              child: const Text('OPEN EMAIL APP'),
            ),
          ),
          h40SizedBox,
        ],
      ),
    );
  }
}
