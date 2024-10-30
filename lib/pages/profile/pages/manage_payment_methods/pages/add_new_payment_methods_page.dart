import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/pages/auth/methods/input_decoration.dart';

import '../../../../../helpers/colors_helper.dart';
import '../../../../../shared/constants/constant_padding.dart';
import '../../../../../shared/layouts/shared_bottom_nav_layout.dart';
import '../../../../../shared/widgets/role_model_appbar_widget.dart';

class AddNewPaymentMethodsPage extends StatelessWidget {
  const AddNewPaymentMethodsPage({super.key});

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
                    'ADD NEW CARD',
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
              padding: pad24All,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'CARD NUMBER',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: ColorsHelper.primary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: Colors.black),
                    decoration: CustomInputDecoration.basicTextFormField(
                        context,
                        hintText: 'XXXX - XXXX - XXXX'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'EXPIRY DATE',
                            style: context.textTheme.labelSmall?.copyWith(
                              color: ColorsHelper.primary,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          width: context.width * .40,
                          child: TextFormField(
                            style: context.textTheme.bodyMedium
                                ?.copyWith(color: Colors.black),
                            decoration:
                                CustomInputDecoration.basicTextFormField(
                                    context,
                                    hintText: 'MM/YY'),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'CVV',
                            style: context.textTheme.labelSmall?.copyWith(
                              color: ColorsHelper.primary,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          width: context.width * .40,
                          child: TextFormField(
                            style: context.textTheme.bodyMedium
                                ?.copyWith(color: Colors.black),
                            decoration:
                                CustomInputDecoration.basicTextFormField(
                                    context,
                                    hintText: 'XXX'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Bottom button [START]
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.height * .04,
              horizontal: 20,
            ),
            child: ElevatedButton(
              onPressed: () {
                //TODO - add card method
              },
              child: const Text('ADD Card'),
            ),
          )
          //Bottom button [END]
        ],
      ),
      bottomNavigationBar: const SharedBottomNavLayout(currentIndex: -1),
    );
  }
}
