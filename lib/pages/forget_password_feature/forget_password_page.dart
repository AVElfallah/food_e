import 'package:flutter/material.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'forgot password',
              style: GoogleFonts.bebasNeue(fontSize: 34, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'We’ll send a password reset link to your email.',
              style: GoogleFonts.poppins(
                color: ColorsHelper.gray,
                fontSize: 14,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              'email',
              style: GoogleFonts.bebasNeue(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: ColorsHelper.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              style: GoogleFonts.poppins(
                fontSize: 14,
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
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 40,
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
