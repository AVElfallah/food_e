import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';

import 'package:food_e/helpers/assets_helper.dart';
import 'package:food_e/pages/home/widgets/home_custom_appbar_widget.dart';

import '../../shared/layouts/shared_bottom_nav_layout.dart';
import 'layouts/adds_banners_layouts.dart';
import 'layouts/recommended_for_you_layout.dart';
import 'widgets/company_logo_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeCustomAppbarWidget(),
        body: ListView(
          children: [
            //Adds banner
            const AddsBannersLayouts(),
            //end adds banner
            const SizedBox(
              height: 20,
            ),

            // Recommended for you
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Recommended for you',
                style: context.textTheme.labelSmall,
              ),
            ),
            const RecommendedForYouLayout(),

            /// Recommended for you [END]
            ///
            /// RESTAURANTS [START]
            ///
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'RESTAURANTS',
                style: context.textTheme.labelSmall,
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .13,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: const [
                  CompanyLogoCardWidget(),
                  CompanyLogoCardWidget(
                    imageURL: AssetsHelper.dominopImage,
                  ),
                  CompanyLogoCardWidget(
                    imageURL: AssetsHelper.bkingImage,
                  ),
                  CompanyLogoCardWidget(
                    imageURL: AssetsHelper.phutImage,
                  ),
                  CompanyLogoCardWidget(
                    imageURL: AssetsHelper.scompanyImage,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            )

            ///
            /// RESTAURANTS [END]
          ],
        ),
        bottomNavigationBar: const SharedBottomNavLayout(
          currentIndex: 0,
        ));
  }
}
