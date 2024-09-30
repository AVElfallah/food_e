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
import 'package:food_e/pages/splash/splash_page.dart';

import '../pages/basket/basket_page.dart';
import '../pages/favorite/favorite_page.dart';
import '../pages/meal/meal_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/search/search_page.dart';

class RouterHelper {
  //Pages
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

// method
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name ?? '') {
      //Splash page section here you can add some future features
      case splashPage:
        return MaterialPageRoute(
            builder: (context) => const SplashPage(), settings: settings);

      //GetStartedPage
      case getStartedPage:
        return MaterialPageRoute(
          builder: (context) => const GetStartedPage(),
          settings: settings,
        );

      //Login Page
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
          settings: settings,
        );

      //ForgetPassword Page
      case forgetPasswordPage:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordPage(),
          settings: settings,
        );

      //Register Page
      case registerPage:
        return MaterialPageRoute(
          builder: (ctx) => const RegisterPage(),
          settings: settings,
        );

      //EmailSent Page
      case emailSentPage:
        return MaterialPageRoute(
          builder: (ctx) => const EmailSentPage(),
          settings: settings,
        );

      //RestPassword Page
      case resetPasswordPage:
        return MaterialPageRoute(
          builder: (ctx) => const ResetPasswordPage(),
          settings: settings,
        );

      //Address Setup Page
      case addressSetupPage:
        return MaterialPageRoute(
          builder: (ctx) => const AddressSetup(),
          settings: settings,
        );

      //Payment setup page
      case paymentSetupPage:
        return MaterialPageRoute(
          builder: (ctx) => const PaymentSetupPage(),
          settings: settings,
        );

      //Home page
      case homePage:
        return PageRouteSlidable(
          page: (ctx) => const HomePage(),
          settings: settings,
        );

      //meal page
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
      //Search page
      case searchPage:
        return PageRouteSlidable(
          page: (ctx) => const SearchPage(),
          settings: settings,
        );

      case basketPage:
        return PageRouteSlidable(
          page: (ctx) => const BasketPage(),
          settings: settings,
        );

      case favoritePage:
        return PageRouteSlidable(
          page: (ctx) => const FavoritePage(),
          settings: settings,
        );

      case profilePage:
        return PageRouteSlidable(
          page: (ctx) => const ProfilePage(),
          settings: settings,
        );

      //default page
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
          settings: settings,
        );
    }
  }
}
