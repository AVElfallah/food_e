import 'package:flutter/material.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/shared/layouts/shared_bottom_nav_layout.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Text(
            'Abdulrhman Elfallah',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),

          // Menu List
          Expanded(
            child: ListView(
              children: const [
                ProfileItemWidget(
                    icon: Icons.edit, title: 'Account and Profile'),
                ProfileItemWidget(
                    icon: Icons.payment, title: 'Manage Payment Methods'),
                ProfileItemWidget(
                    icon: Icons.location_on, title: 'Manage Addresses'),
                ProfileItemWidget(icon: Icons.history, title: 'Order History'),
                ProfileItemWidget(
                    icon: Icons.support_agent, title: 'Contact Support'),
                ProfileItemWidget(
                    icon: Icons.card_giftcard, title: 'Refer to a Friend'),
                ProfileItemWidget(icon: Icons.star, title: 'Write a Review'),
                ProfileItemWidget(
                    icon: Icons.description, title: 'Terms and Conditions'),
                ProfileItemWidget(
                    icon: Icons.privacy_tip, title: 'Privacy Policy'),
                ProfileItemWidget(icon: Icons.logout, title: 'Logout'),
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
