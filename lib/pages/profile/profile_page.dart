import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/controllers/riverpod_objects/riverpod_objects.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/shared/layouts/shared_bottom_nav_layout.dart';
import 'package:food_e/shared/widgets/loader_widget.dart';
import 'package:food_e/shared/widgets/show_error_snackbar.dart';

import '../../helpers/assets_helper.dart';
import 'widgets/profile_item_widget.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var mainProvider = mainAppController;
    var profileProvider = profilePageController;
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
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return ListTile(
                      title: Text(
                        'Dark Mode',
                        style: context.textTheme.bodyMedium,
                      ),
                      leading: const Icon(
                        Icons.dark_mode,
                        color: ColorsHelper.primary,
                      ),
                      trailing: Switch(
                        value: ref.watch(mainProvider).isDarkMode,
                        onChanged: (value) {
                          ref.read(mainProvider).changeDarkMode();
                        },
                      ),
                    );
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
                    showLoader(context);
                    ref.read(profileProvider).singout(onSuccess: () {
                      hideLoader();
                      Navigator.of(context)
                          .popAndPushNamed(RouterHelper.loginPage);
                    }, onError: (error) {
                      hideLoader();
                      showErrorSnackBar(context, error);
                    });
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
