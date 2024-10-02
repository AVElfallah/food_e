import 'package:flutter/material.dart';
import 'package:food_e/shared/widgets/role_model_appbar_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/policy_parts_widgets.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: RoleModelAppbarWidget(
        context,
        leadingIcon: Icons.arrow_back_ios_new,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PRIVACY POLICY',
              style: GoogleFonts.bebasNeue(
                fontSize: 36,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Expanded(
              child: ListView(
                children: [
                  PolicyPartsWidgets(
                    title: 'TITLE',
                    description: '''
              Nesciunt tenetur maiores voluptatem maxime. Corrupti cum ab numquam eaque facere. Veritatis ut et eveniet autem dolor aut facere.
              ''',
                    subTitles: const [
                      {
                        'title': 'SUBTITLE',
                        'description':
                            'Nesciunt tenetur maiores voluptatem maxime. Corrupti cum ab numquam eaque facere. Veritatis ut et eveniet autem dolor aut facere.'
                      },
                      {
                        'title': 'SUBTITLE',
                        'description':
                            'Nesciunt tenetur maiores voluptatem maxime. Corrupti cum ab numquam eaque facere. Veritatis ut et eveniet autem dolor aut facere.'
                      },
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  PolicyPartsWidgets(
                    title: 'TITLE',
                    description: '''
              Nesciunt tenetur maiores voluptatem maxime. Corrupti cum ab numquam eaque facere. Veritatis ut et eveniet autem dolor aut facere.
              ''',
                    subTitles: const [
                      {
                        'title': 'SUBTITLE',
                        'description':
                            'Nesciunt tenetur maiores voluptatem maxime. Corrupti cum ab numquam eaque facere. Veritatis ut et eveniet autem dolor aut facere.'
                      },
                      {
                        'title': 'SUBTITLE',
                        'description':
                            'Nesciunt tenetur maiores voluptatem maxime. Corrupti cum ab numquam eaque facere. Veritatis ut et eveniet autem dolor aut facere.'
                      },
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
