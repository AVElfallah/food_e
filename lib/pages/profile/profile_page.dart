import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/shared/layouts/shared_bottom_nav_layout.dart';

import '../../helpers/assets_helper.dart';
import 'widgets/profile_item_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Section
          const Padding(
            padding: EdgeInsets.only(top: 80, bottom: 10.0),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: ColorsHelper.primary,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage(
                  AssetsHelper.profilePic,
                ),
              ),
            ),
          ),
          // User Name
          Text(
            'Abdulrhman Elfallah',
            style: context.textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),

          // Menu List
          Expanded(
            child: ListView(
              children: [
                ProfileItemWidget(
                  icon: Icons.edit,
                  title: 'Account and Profile',
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouterHelper.accountProfilePage);
                  },
                ),
                ProfileItemWidget(
                  icon: Icons.payment,
                  title: 'Manage Payment Methods',
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouterHelper.managePaymentMethodsPage);
                  },
                ),
                ProfileItemWidget(
                  icon: Icons.location_on,
                  title: 'Manage Addresses',
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouterHelper.manageAddressesPage);
                  },
                ),
                ProfileItemWidget(
                  icon: Icons.history,
                  title: 'Order History',
                  onTap: () {
                    Navigator.pushNamed(context, RouterHelper.orderHistoryPage);
                  },
                ),
                ProfileItemWidget(
                  icon: Icons.support_agent,
                  title: 'Contact Support',
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouterHelper.contactSupportPage);
                  },
                ),
                ProfileItemWidget(
                  icon: Icons.card_giftcard,
                  title: 'Refer to a Friend',
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouterHelper.referToAFriendPage);
                  },
                ),
                ProfileItemWidget(
                  icon: Icons.star,
                  title: 'Write a Review',
                  onTap: () {
                    //TODO - add write a review here
                  },
                ),
                ProfileItemWidget(
                  icon: Icons.description,
                  title: 'Terms and Conditions',
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouterHelper.termsAndConditionsPage);
                  },
                ),
                ProfileItemWidget(
                  icon: Icons.privacy_tip,
                  title: 'Privacy Policy',
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouterHelper.privacyPolicyPage);
                  },
                ),
                ProfileItemWidget(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () {
                    //TODO - don't forget to complete log out
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: const SharedBottomNavLayout(
        currentIndex: 4,
      ),
    );
  }
}
