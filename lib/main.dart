import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_e/controllers/riverpod_objects/riverpod_objects.dart';
import 'package:food_e/firebase_options.dart';
import 'package:food_e/helpers/di_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/helpers/theme_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/app_internal_data.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  serviceLocatorInit();
  await AppInternalData.init();
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var canvasWidth = MediaQuery.of(context).size.width;
    var canvasHeight = MediaQuery.of(context).size.height;
    // di
    var riverpodController = mainAppController;

    //
    return MaterialApp(
      title: 'Food-E',
      debugShowCheckedModeBanner: false,
      themeMode: (ref.watch(riverpodController).isDarkMode)
          ? ThemeMode.dark
          : ThemeMode.light,

      theme: ThemeHelper.lightTheme(canvasWidth, canvasHeight),
      darkTheme: ThemeHelper.darkTheme(canvasWidth, canvasHeight),
      //home:  ChangePasswordPage(),
      initialRoute: RouterHelper.splashPage,
      onGenerateRoute: RouterHelper.generateRoute,
    );
  }
}
