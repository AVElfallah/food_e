import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/extensions/widget_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/shared/constants/constant_sizedboxes.dart';
import 'package:food_e/shared/widgets/loader_widget.dart';
import 'package:food_e/shared/widgets/show_error_snackbar.dart';

import '../../../controllers/riverpod_objects/riverpod_objects.dart';
import '../../../shared/widgets/role_model_appbar_widget.dart';

class EmailSentPage extends ConsumerStatefulWidget {
  const EmailSentPage({super.key});

  @override
  ConsumerState<EmailSentPage> createState() => _EmailSentPage();
}

class _EmailSentPage extends ConsumerState<EmailSentPage> {
  ValueNotifier<int> countdown = ValueNotifier(120);
  late Timer countdownTimer;

  @override
  void initState() {
    super.initState();
    countdownTimer = createTimer();
  }

  Timer createTimer() {
    return Timer.periodic(const Duration(milliseconds: 1000), (_) {
      if (countdown.value == 0) {
        countdownTimer.cancel();
      } else {
        countdown.value -= 1;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    countdownTimer.cancel();
    countdown.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var forgetPasswordProvider = ref.watch(forgetPasswordPageController);
    var readCurrentPageProvider = ref.read(forgetPasswordPageController);

    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: ListView(
        children: [
          Text(
            'Email sent',
            style: context.textTheme.headlineLarge!,
          ).padding(15),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: RichText(
              text: TextSpan(
                text: "we've sent you an email at ",
                style: context.textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: '${forgetPasswordProvider.emailController.text}\n',
                    style: const TextStyle(
                      color: ColorsHelper.primary,
                    ),
                  ),
                  const TextSpan(
                    text:
                        'for verification. Check your email for the verification link.',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: context.height * .35),
          //start Timer counter
          ValueListenableBuilder(
            valueListenable: countdown,
            builder: (context, value, child) => Text(
              '${(value ~/ 60).toString().padLeft(2, '0')}:${(value % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(
                color: ColorsHelper.secondary,
                fontWeight: FontWeight.bold,
              ),
            ).paddingSymmetric(horizontal: 20),
          ),
          //end
          h40SizedBox,

          // Text received email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Did not receive the email yet?',
              style: context.textTheme.bodyMedium,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: TextButton(
              onPressed: () {
                if (countdown.value != 0) {
                } else {
                  showLoader(context);
                  countdown.value = 120;
                  countdownTimer = createTimer();
                  readCurrentPageProvider.sendResetPasswordLink(
                    onSuccess: () {
                      hideLoader();
                      showInfoSnackBar(context, 'Email sent successfully');
                    },
                    onError: (error) {
                      hideLoader();
                      showErrorSnackBar(context, 'Error: $error');
                    },
                  );
                }
              },
              child: Text(
                'Resend',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: ColorsHelper.primary,
                ),
              ),
            ),
          ).paddingSymmetric(horizontal: 10),
          //end email

          h30SizedBox,

          //
          Center(
            child: ElevatedButton(
              onPressed: () {
                //TODO - add open email app

                Navigator.of(context).pushReplacementNamed(
                  RouterHelper.resetPasswordPage,
                );
              },
              child: const Text('OPEN EMAIL APP'),
            ),
          ),
          h40SizedBox,
        ],
      ),
    );
  }
}
