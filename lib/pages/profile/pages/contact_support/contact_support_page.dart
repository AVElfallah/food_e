import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/shared/widgets/role_model_appbar_widget.dart';

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
                      style: context.textTheme.headlineLarge,
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
                        style: context.textTheme.bodyMedium!,
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
                        style: context.textTheme.bodyMedium!,
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
                        style: context.textTheme.bodyMedium!,
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
