import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_e/helpers/assets_helper.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/shared/widgets/role_model_appbar_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountProfilePage extends StatefulWidget {
  const AccountProfilePage({super.key});

  @override
  State<AccountProfilePage> createState() => _AccountProfilePageState();
}

class _AccountProfilePageState extends State<AccountProfilePage> {
  final TextEditingController _firstNameController =
      TextEditingController(text: "John");
  final TextEditingController _lastNameController =
      TextEditingController(text: "Doe");
  final TextEditingController _emailController =
      TextEditingController(text: "johndoe@email.com");

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
            // Page Title
            Text(
              'ACCOUNT AND PROFILE',
              style: GoogleFonts.bebasNeue(
                fontSize: 36,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            // Delete Account Button
            TextButton(
              onPressed: () {
                // Add delete account functionality
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    AssetsHelper.recycleIcon,
                    // ignore: deprecated_member_use
                    color: ColorsHelper.alertError,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 14),
                  Text(
                    'Delete Account',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: ColorsHelper.alertError,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .25,
            ),
            // First Name Field
            SizedBox(
              height: height * .08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //1st Name [START]
                  //
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            'FIRST NAME',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 12,
                              color: ColorsHelper.primary,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .05,
                          child: TextField(
                            controller: _firstNameController,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: 'John',
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
                  //
                  //1st Name [END]
                  const SizedBox(
                    width: 10,
                  ),
                  //2nd Name [START]
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            'LAST NAME',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 12,
                              color: ColorsHelper.primary,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .05,
                          child: TextField(
                            controller: _lastNameController,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Doe',
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
                  //2nd Name [END]
                ],
              ),
            ),
            const SizedBox(height: 20),
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
                      'FIRST NAME',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 12,
                        color: ColorsHelper.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                    child: TextField(
                      controller: _emailController,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'John',
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

            // Change Password Button
            TextButton(
              onPressed: () {
                // Navigate to change password page
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.lock, color: ColorsHelper.primary),
                  const SizedBox(width: 20),
                  Text(
                    'Change Password',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 12,
                  ),
                ],
              ),
            ),
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
