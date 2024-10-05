import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';

import '../../../../helpers/colors_helper.dart';
import '../../../../helpers/router_helper.dart';
import '../../../../shared/layouts/shared_bottom_nav_layout.dart';
import '../../../../shared/widgets/role_model_appbar_widget.dart';

class ManagePaymentMethodsPage extends StatelessWidget {
  const ManagePaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: RoleModelAppbarWidget(
        context,
        leadingIcon: Icons.arrow_back_ios_new,
      ),
      body: Column(
        children: [
          //Top text [START]
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MY PAYMENT METHODS',
                    style: context.textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
          ),
          //Top Text [END]
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              padding: const EdgeInsets.all(24),
              shrinkWrap: true,
              children: [
                Text('cash',
                    textAlign: TextAlign.start,
                    style: context.textTheme.labelSmall),
                Text(
                  'Pay using cash',
                  textAlign: TextAlign.start,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: ColorsHelper.gray,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'MASTERCARD - 0164',
                  textAlign: TextAlign.start,
                  style: context.textTheme.labelSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'XXXX XXXX XXXX 0164',
                      textAlign: TextAlign.start,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: ColorsHelper.gray,
                      ),
                    ),
                    Text(
                      '12/24',
                      textAlign: TextAlign.start,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: ColorsHelper.gray,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'VISA - 3648',
                  textAlign: TextAlign.start,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: ColorsHelper.secondary,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'XXXX XXXX XXXX 3648',
                      textAlign: TextAlign.start,
                      style: context.textTheme.bodyMedium,
                    ),
                    Text(
                      '12/24',
                      textAlign: TextAlign.start,
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Bottom button [START]
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.height * .04),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouterHelper.addNewPaymentMethodsPage,
                );
              },
              child: const Text('ADD NEW PAYMENT METHOD'),
            ),
          )
          //Bottom button [END]
        ],
      ),
      bottomNavigationBar: const SharedBottomNavLayout(currentIndex: -1),
    );
  }
}
