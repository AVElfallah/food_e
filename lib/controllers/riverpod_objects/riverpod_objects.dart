import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../forget_password_page_controller.dart';
import '../home_page_controller.dart';
import '../login_page_controller.dart';
import '../main_app_controller.dart';
import '../profile_page_controller.dart';
import '../register_page_controller.dart';
import '../splash_page_controller.dart';

// Main App Controller
final ChangeNotifierProvider<MainAppController> mainAppController =
    ChangeNotifierProvider<MainAppController>((ref) => MainAppController());
//

// Register Page Controller
final ChangeNotifierProvider<RegisterPageController> registerPageController =
    ChangeNotifierProvider<RegisterPageController>(
        (ref) => RegisterPageController());
//

// Splash Page Controller
final ChangeNotifierProvider<SplashPageController> splashPageController =
    ChangeNotifierProvider<SplashPageController>(
        (ref) => SplashPageController());
//

// Profile Page Controller
final ChangeNotifierProvider<ProfilePageController> profilePageController =
    ChangeNotifierProvider<ProfilePageController>(
        (ref) => ProfilePageController());
//

// Login Page Controller
final ChangeNotifierProvider<LoginPageController> loginPageController =
    ChangeNotifierProvider<LoginPageController>((ref) => LoginPageController());
//

// Forget Password Page Controller
final ChangeNotifierProvider<ForgetPasswordPageController>
    forgetPasswordPageController =
    ChangeNotifierProvider<ForgetPasswordPageController>(
        (ref) => ForgetPasswordPageController());
//

// Home Page Controller
final ChangeNotifierProvider<HomePageController> homePageController =
    ChangeNotifierProvider<HomePageController>((ref) => HomePageController());
    //
