import 'package:flutter/material.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/role_model_appbar_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              'Login',
              style: GoogleFonts.bebasNeue(fontSize: 34, color: Colors.white),
            ),
          ),
          const Spacer(),
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
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              'Password',
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
                style: GoogleFonts.poppins(
                  color: ColorsHelper.gray,
                  fontSize: 14,
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
                style: GoogleFonts.poppins(
                  color: ColorsHelper.gray,
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RouterHelper.registerPage);
                },
                child: Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    color: ColorsHelper.secondary,
                    fontSize: 14,
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
