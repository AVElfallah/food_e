import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';

import '../../../../shared/constants/constant_padding.dart';
import '../../../../shared/widgets/role_model_appbar_widget.dart';
import 'widgets/terms_and_conditions_parts_widgets.dart';

// This is a stateless widget representing the Terms and Conditions page.
class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the height of the screen.
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      // Custom app bar widget with a back button.
      appBar: RoleModelAppbarWidget(
        context,
        leadingIcon: Icons.arrow_back_ios_new,
      ),
      body: Padding(
        padding: pad14All, // Padding around the body content.
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start.
          children: [
            // Title text with custom font.
            Text(
              'TERMS AND CONDITIONS',
              style: context.textTheme.headlineLarge,
            ),
            SizedBox(
              height:
                  height * .05, // Spacer with height relative to screen height.
            ),
            // Expanded widget to make the ListView take up remaining space.
            Expanded(
              child: ListView(
                children: [
                  // Custom widget displaying a section of terms and conditions.
                  TermsAndConditionsPartsWidgets(
                    title: 'TITLE',
                    description:
                        '''Nesciunt tenetur maiores voluptatem maxime. Corrupti cum ab numquam eaque facere. Veritatis ut et eveniet autem dolor aut facere.
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
                    height: 50, // Spacer between sections.
                  ),
                  // Another section of terms and conditions.
                  TermsAndConditionsPartsWidgets(
                    title: 'TITLE',
                    description:
                        '''Nesciunt tenetur maiores voluptatem maxime. Corrupti cum ab numquam eaque facere. Veritatis ut et eveniet autem dolor aut facere.
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
