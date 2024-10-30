import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/shared/widgets/role_model_appbar_widget.dart';

import '../../../helpers/colors_helper.dart';
import '../../../shared/constants/constant_sizedboxes.dart';
import '../../../shared/constants/constant_padding.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: ListView(
        children: [
          Padding(
            padding: pad15All,
            child: Text(
              'RESET PASSWORD',
              style: context.textTheme.headlineLarge!,
            ),
          ),
          h20SizedBox,

          //start new password
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'New Password',
              style: context.textTheme.labelSmall?.copyWith(
                color: ColorsHelper.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: SizedBox(
              height: 45,
              child: TextFormField(
                style: context.textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility,
                      color: ColorsHelper.primary,
                    ),
                  ),
                  hintText: 'password',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),

          /// end new password
          ///
          h30SizedBox,
          //start new password
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'CONFIRM PASSWORD',
              style: context.textTheme.labelSmall?.copyWith(
                color: ColorsHelper.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: SizedBox(
              height: 45,
              child: TextFormField(
                style: context.textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility,
                      color: ColorsHelper.primary,
                    ),
                  ),
                  hintText: 'Confirm Password',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: context.height * .35,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                //TODO - add reset password feature
              },
              child: const Text('RESET PASSWORD'),
            ),
          ),
          h40SizedBox
        ],
      ),
    );
  }
}
