import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/controllers/riverpod_objects/riverpod_objects.dart';
import 'package:food_e/helpers/page_builder.dart';
import 'package:food_e/model/meal_model.dart';
import 'package:food_e/pages/auth/get_started_page.dart';
import 'package:food_e/pages/auth/pages/address_setup.dart';
import 'package:food_e/pages/auth/pages/payment_setup_page.dart';
import 'package:food_e/pages/forget_password/forget_password_page.dart';
import 'package:food_e/pages/auth/pages/login_page.dart';
import 'package:food_e/pages/auth/pages/register_page.dart';
import 'package:food_e/pages/forget_password/pages/email_sent_page.dart';
import 'package:food_e/pages/forget_password/pages/reset_password_page.dart';
import 'package:food_e/pages/home/home_page.dart';
import 'package:food_e/pages/order/checkout/checkout_page.dart';
import 'package:food_e/pages/profile/pages/change_password/change_password_page.dart';
import 'package:food_e/pages/profile/pages/manage_addresses/pages/add_new_address_page.dart';
import 'package:food_e/pages/splash/splash_page.dart';

import '../pages/basket/basket_page.dart';
import '../pages/favorite/favorite_page.dart';
import '../pages/meal/meal_page.dart';
import '../pages/profile/pages/account_profile/account_profile_page.dart';
import '../pages/profile/pages/contact_support/contact_support_page.dart';
import '../pages/profile/pages/manage_addresses/manage_addresses_page.dart';
import '../pages/profile/pages/manage_payment_methods/manage_payment_methods_page.dart';
import '../pages/profile/pages/manage_payment_methods/pages/add_new_payment_methods_page.dart';
import '../pages/profile/pages/order_history/order_history_page.dart';
import '../pages/profile/pages/privacy_policy/privacy_policy_page.dart';
import '../pages/profile/pages/refer_to_a_friend/refer_to_a_friend_page.dart';
import '../pages/profile/pages/terms_and_conditions/terms_and_conditions_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/search/search_page.dart';
import '../shared/common/custom_material_page_router.dart';

/// This class is responsible for defining the routes and generating the appropriate
/// pages based on the route settings. It helps in navigating between different pages
/// in the application.
class RouterHelper {
  // Define route names as constants for easy reference and to avoid typos.
  static const String splashPage = '/';
  static const String homePage = "/home";
  static const String getStartedPage = '/getstarted';
  static const String loginPage = '/getstarted/login';
  static const String registerPage = '/getstarted/register';
  static const String addressSetupPage = '/getstarted/register/address_setup';
  static const String paymentSetupPage = '/getstarted/register/payment_setup';
  static const String forgetPasswordPage = '/forgetpassword';
  static const String emailSentPage = '/forgetpassword/emailsent';
  static const String resetPasswordPage =
      '/forgetpassword/emailsent/resetPassword';
  static const String mealPage = '/home/meal/';
  static const String searchPage = '/home/search/';
  static const basketPage = '/home/basket/';
  static const favoritePage = '/home/favorite/';
  //
  static const profilePage = '/home/profile/';
  static const accountProfilePage = '/home/profile/account_profile';
  static const changePasswordPage = '/home/profile/change_password';
  static const contactSupportPage = '/home/profile/contact_support';
  static const orderHistoryPage = '/home/profile/order_history';
  static const privacyPolicyPage = '/home/profile/privacy_policy';
  static const termsAndConditionsPage = '/home/profile/terms_and_conditions';
  static const referToAFriendPage = '/home/profile/refer_to_a_friend';
  static const manageAddressesPage = '/home/profile/manage_addresses_page';
  static const addNewAddressesPage =
      '/home/profile/manage_addresses_page/add_new_address_page';
  static const managePaymentMethodsPage =
      '/home/profile/manage_payment_methods_page';
  static const addNewPaymentMethodsPage =
      '/home/profile/manage_payment_methods_page/add_new_payment_method_page';
  //
  static const checkoutPage = '/home/basket/checkout';

  /// This method generates the appropriate route based on the route settings.
  /// It uses a switch-case to match the route name and return the corresponding
  /// page wrapped in a MaterialPageRoute or a custom PageRouteSlidable.
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name ?? '') {
      // Splash page route
      case splashPage:
        return CustomMaterialPageRouter.withCondition(
          condition: FirebaseAuth.instance.currentUser != null,
          successPage: ProviderScope(
              overrides: [homePageController], child: const HomePage()),
          failurePage: const SplashPage(),
          settings: settings,
        );

      // GetStarted page route
      case getStartedPage:
        return MaterialPageRoute(
          builder: (context) => const GetStartedPage(),
          settings: settings,
        );

      // Login page route
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => ProviderScope(
            overrides: [loginPageController],
            child: const LoginPage(),
          ),
          settings: settings,
        );

      // ForgetPassword page route
      case forgetPasswordPage:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordPage(),
          settings: settings,
        );

      // Register page route
      case registerPage:
        return MaterialPageRoute(
          builder: (ctx) => ProviderScope(
              overrides: [registerPageController], child: const RegisterPage()),
          settings: settings,
        );

      // EmailSent page route
      case emailSentPage:
        return MaterialPageRoute(
          builder: (ctx) => const EmailSentPage(),
          settings: settings,
        );

      // ResetPassword page route
      case resetPasswordPage:
        return MaterialPageRoute(
          builder: (ctx) => const ResetPasswordPage(),
          settings: settings,
        );

      // Manage payment methods route
      case managePaymentMethodsPage:
        return MaterialPageRoute(
          builder: (ctx) => const ManagePaymentMethodsPage(),
          settings: settings,
        );
      // Manage addresses route
      case manageAddressesPage:
        return MaterialPageRoute(
          builder: (ctx) => const ManageAddressesPage(),
          settings: settings,
        );
      // add new address page
      case addNewAddressesPage:
        return MaterialPageRoute(
          builder: (ctx) => const AddNewAddressPage(),
          settings: settings,
        );

      // AddressSetup page route
      case addressSetupPage:
        return MaterialPageRoute(
          builder: (ctx) => const AddressSetup(),
          settings: settings,
        );

      // PaymentSetup page route
      case paymentSetupPage:
        return MaterialPageRoute(
          builder: (ctx) => const PaymentSetupPage(),
          settings: settings,
        );

      // add new payment method
      case addNewPaymentMethodsPage:
        return MaterialPageRoute(
          builder: (ctx) => const AddNewPaymentMethodsPage(),
          settings: settings,
        );

      // Home page route
      case homePage:
        if (FirebaseAuth.instance.currentUser != null) {
          return PageRouteSlidable(
            page: (ctx) => ProviderScope(
                overrides: [homePageController], child: const HomePage()),
            settings: settings,
          );
        } else {
          return MaterialPageRoute(
            builder: (ctx) => const GetStartedPage(),
            settings: settings,
          );
        }

      // Meal page route
      // ToDO: Implement MealPage
      case mealPage:
        MealModel meal = settings.arguments as MealModel;

        var rSettings = RouteSettings(
          name: mealPage + (meal.name ?? 'error'),
          arguments: settings.arguments,
        );

        return MaterialPageRoute(
          builder: (ctx) => const MealPage(),
          settings: rSettings,
        );

      // Search page route
      case searchPage:
        return PageRouteSlidable(
          page: (ctx) => const SearchPage(),
          settings: settings,
        );

      // Account profile route
      case accountProfilePage:
        return MaterialPageRoute(
          builder: (ctx) => const AccountProfilePage(),
          settings: settings,
        );

      // change password page
      case changePasswordPage:
        return MaterialPageRoute(
          builder: (ctx) => const ChangePasswordPage(),
          settings: settings,
        );

      // contact support page
      case contactSupportPage:
        return MaterialPageRoute(
          builder: (ctx) => const ContactSupportPage(),
          settings: settings,
        );

      // order history page
      case orderHistoryPage:
        return MaterialPageRoute(
          builder: (ctx) => const OrderHistoryPage(),
          settings: settings,
        );

      // privacy policy page
      case privacyPolicyPage:
        return MaterialPageRoute(
          builder: (ctx) => const PrivacyPolicyPage(),
          settings: settings,
        );

      // terms and conditions page
      case termsAndConditionsPage:
        return MaterialPageRoute(
          builder: (ctx) => const TermsAndConditionsPage(),
          settings: settings,
        );

      // refer to a friend page
      case referToAFriendPage:
        return MaterialPageRoute(
          builder: (ctx) => const ReferToAFriendPage(),
          settings: settings,
        );

      // Basket page route
      case basketPage:
        return PageRouteSlidable(
          page: (ctx) => const BasketPage(),
          settings: settings,
        );

      // Favorite page route
      case favoritePage:
        return PageRouteSlidable(
          page: (ctx) => const FavoritePage(),
          settings: settings,
        );

      // Profile page route
      case profilePage:
        return PageRouteSlidable(
          page: (ctx) => const ProfilePage(),
          settings: settings,
        );

      // Checkout page route
      case checkoutPage:
        return MaterialPageRoute(
          builder: (ctx) => const CheckoutPage(),
          settings: settings,
        );

      // Default route (fallback to Splash page)
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
          settings: settings,
        );
    }
  }
}
