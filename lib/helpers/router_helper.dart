import 'package:flutter/material.dart';
import 'package:food_e/helpers/page_builder.dart';
import 'package:food_e/model/meal_model.dart';
import 'package:food_e/pages/auth/get_started_page.dart';
import 'package:food_e/pages/auth/pages/address_setup.dart';
import 'package:food_e/pages/auth/pages/payment_setup_page.dart';
import 'package:food_e/pages/forget_password_feature/forget_password_page.dart';
import 'package:food_e/pages/auth/pages/login_page.dart';
import 'package:food_e/pages/auth/pages/register_page.dart';
import 'package:food_e/pages/forget_password_feature/pages/email_sent_page.dart';
import 'package:food_e/pages/forget_password_feature/pages/reset_password_page.dart';
import 'package:food_e/pages/home/home_page.dart';
import 'package:food_e/pages/order/checkout/checkout_page.dart';
import 'package:food_e/pages/splash/splash_page.dart';

import '../pages/basket/basket_page.dart';
import '../pages/favorite/favorite_page.dart';
import '../pages/meal/meal_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/search/search_page.dart';

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
  static const profilePage = '/home/profile/';
  static const checkoutPage = '/home/basket/checkout';

  /// This method generates the appropriate route based on the route settings.
  /// It uses a switch-case to match the route name and return the corresponding
  /// page wrapped in a MaterialPageRoute or a custom PageRouteSlidable.
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name ?? '') {
      // Splash page route
      case splashPage:
        return MaterialPageRoute(
            builder: (context) => const SplashPage(), settings: settings);

      // GetStarted page route
      case getStartedPage:
        return MaterialPageRoute(
          builder: (context) => const GetStartedPage(),
          settings: settings,
        );

      // Login page route
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
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
          builder: (ctx) => const RegisterPage(),
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

      // Home page route
      case homePage:
        return PageRouteSlidable(
          page: (ctx) => const HomePage(),
          settings: settings,
        );

      // Meal page route
      case mealPage:
        MealModel meal = settings.arguments as MealModel;

        var rSettings = RouteSettings(
          name: mealPage + (meal.mealName ?? 'error'),
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
