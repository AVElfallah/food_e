import 'package:flutter/material.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/shared/widgets/role_model_appbar_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSupportPage extends StatelessWidget {
  const ContactSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: RoleModelAppbarWidget(
          context,
          leadingIcon: Icons.arrow_back_ios_new,
        ),
        body: Stack(
          children: [
            //Top text [START]
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CONTACT SUPPORT',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 36,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.phone_outlined,
                        color: ColorsHelper.primary,
                      ),
                      onTap: () {
                        //TODO - add acction to phone number
                      },
                      title: Text(
                        '+00 123 456 7890',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.email_outlined,
                        color: ColorsHelper.primary,
                      ),
                      onTap: () {
                        //TODO - add action to gmail
                      },
                      title: Text(
                        'support@foode.com',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.chat_outlined,
                        color: ColorsHelper.primary,
                      ),
                      onTap: () {
                        //TODO - add action to chat
                      },
                      title: Text(
                        'chat on WhatsApp',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Top Text [END]
          ],
        ));
  }
}
