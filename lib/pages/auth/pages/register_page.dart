import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/colors_helper.dart';
import '../../../helpers/router_helper.dart';
import '../../../shared/widgets/role_model_appbar_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
              'Register',
              style: GoogleFonts.bebasNeue(fontSize: 34, color: Colors.white),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          // start full name textfrom
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              'full name',
              style: GoogleFonts.bebasNeue(
                fontSize: 18,
                color: ColorsHelper.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
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
              style: GoogleFonts.bebasNeue(
                fontSize: 18,
                color: ColorsHelper.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
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
              style: GoogleFonts.bebasNeue(
                fontSize: 18,
                color: ColorsHelper.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
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
              style: GoogleFonts.bebasNeue(
                fontSize: 18,
                color: ColorsHelper.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextFormField(
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
                Navigator.of(context)
                    .pushReplacementNamed(RouterHelper.addressSetupPage);
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
                style: GoogleFonts.poppins(
                  color: ColorsHelper.gray,
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RouterHelper.loginPage);
                },
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    color: ColorsHelper.secondary,
                    fontSize: 14,
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
