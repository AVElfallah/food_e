import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/shared/layouts/shared_bottom_nav_layout.dart';
import 'package:food_e/shared/widgets/role_model_appbar_widget.dart';

class ManageAddressesPage extends StatelessWidget {
  const ManageAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: RoleModelAppbarWidget(
        context,
        leadingIcon: Icons.arrow_back_ios_new,
      ),
      body: Column(
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
                    'MY ADDRESSES',
                    style: context.textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
          ),
          //Top Text [END]
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: ListView(
              padding: const EdgeInsets.all(24),
              shrinkWrap: true,
              children: [
                Text(
                  'PARTY PLACE',
                  textAlign: TextAlign.start,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: ColorsHelper.secondary,
                  ),
                ),
                Text(
                  'Apt. 12, Watson Bldg., 13th Ave. and St. James St., 406035',
                  textAlign: TextAlign.start,
                  style: context.textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'OFFICE',
                  textAlign: TextAlign.start,
                  style: context.textTheme.labelSmall,
                ),
                Text(
                  'Suite 03, Johnson Business Park, 554537',
                  textAlign: TextAlign.start,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: ColorsHelper.gray,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Home',
                  textAlign: TextAlign.start,
                  style: context.textTheme.labelSmall,
                ),
                Text(
                  'Apt. 12, Watson Bldg., 13th Ave. and St. James St., 406035',
                  textAlign: TextAlign.start,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: ColorsHelper.gray,
                  ),
                ),
              ],
            ),
          ),
          //Bottom button [START]
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.height * .04),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouterHelper.addNewAddressesPage,
                );
              },
              child: const Text('ADD NEW ADDRESS'),
            ),
          )
          //Bottom button [END]
        ],
      ),
      bottomNavigationBar: const SharedBottomNavLayout(currentIndex: -1),
    );
  }
}
