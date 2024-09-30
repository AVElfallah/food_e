import 'package:flutter/material.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/role_model_appbar_widget.dart';

class EmailSentPage extends StatelessWidget {
  const EmailSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Email sent',
              style: GoogleFonts.bebasNeue(
                fontSize: 34,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: RichText(
              text: TextSpan(
                text: "we've sent you an email at ",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
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
          const Spacer(),
          //start Timer counter
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '0:38',
              style: TextStyle(
                color: ColorsHelper.secondary,
              ),
            ),
          ),
          //end
          const SizedBox(
            height: 40,
          ),

          // Text recived email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Did not receive the email yet?',
              style: GoogleFonts.poppins(
                color: ColorsHelper.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Resend',
                style: GoogleFonts.poppins(
                  color: ColorsHelper.primary,
                ),
              ),
            ),
          ),
          //end email

          const SizedBox(
            height: 60,
          ),

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
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
