import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../helpers/colors_helper.dart';
import '../../../../shared/widgets/role_model_appbar_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPasswordController = TextEditingController();

  final TextEditingController _newPasswordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: RoleModelAppbarWidget(
        context,
        leadingIcon: Icons.arrow_back_ios_new,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Text(
              'Change Password',
              style: GoogleFonts.bebasNeue(
                fontSize: 36,
                color: Colors.white,
              ),
            ),

            SizedBox(height: height * .3),
            // Email Field
            // Email Text [START]
            SizedBox(
              height: height * .08,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      'OLD PASSWORD',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 12,
                        color: ColorsHelper.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                    child: TextField(
                      controller: _oldPasswordController,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'old password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Email Text [END]
            // Email Text [START]
            SizedBox(
              height: height * .08,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      'NEW PASSWORD',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 12,
                        color: ColorsHelper.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                    child: TextField(
                      controller: _newPasswordController,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'new password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Email Text [END]
            // Email Text [START]
            SizedBox(
              height: height * .08,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      'CONFIRM PASSWORD',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 12,
                        color: ColorsHelper.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                    child: TextField(
                      controller: _confirmPasswordController,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'confirm password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Email Text [END]

            const SizedBox(height: 20),
            // Update Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add update functionality
                },
                child: const Text('UPDATE'),
              ),
            ),
            SizedBox(
              height: height * .1,
            )
          ],
        ),
      ),
    );
  }
}
