import 'package:flutter/material.dart';
import 'package:food_e/shared/widgets/role_model_appbar_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/colors_helper.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

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
              'RESET PASSWORD',
              style: GoogleFonts.bebasNeue(fontSize: 34, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //start new password
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'New Password',
              style: GoogleFonts.bebasNeue(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: ColorsHelper.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: SizedBox(
              height: 45,
              child: TextFormField(
                style: GoogleFonts.poppins(
                  fontSize: 14,
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
          ),

          /// end new password
          ///
          const SizedBox(
            height: 30,
          ),
          //start new password
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'CONFIRM PASSWORD',
              style: GoogleFonts.bebasNeue(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: ColorsHelper.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: SizedBox(
              height: 45,
              child: TextFormField(
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility,
                      color: ColorsHelper.primary,
                    ),
                  ),
                  hintText: 'Confirm Password',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),

          /// end new password
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                //TODO - add reset password feature
              },
              child: const Text('RESET PASSWORD'),
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
