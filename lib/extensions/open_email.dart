import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

Future<void> openEmailClient() async {
  Uri emailUrl;

  if (Platform.isIOS) {
    // Open iCloud email app on iPhones
    emailUrl = Uri.parse('message://');
  } else {
    // Open Gmail app on non-iPhone devices
    emailUrl = Uri.parse('mailto:');
  }

  if (await canLaunchUrl(emailUrl)) {
    await launchUrl(emailUrl);
  } else {
    // Handle error case
    if (kDebugMode) {
      print('Could not launch email client');
    }
  }
}
