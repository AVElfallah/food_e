import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/shared/constants/constant_lists.dart';

import '../../../../../helpers/colors_helper.dart';
import '../../../../../helpers/router_helper.dart';
import '../../../../../shared/constants/constant_padding.dart';
import '../../../../../shared/layouts/shared_bottom_nav_layout.dart';
import '../../../../../shared/widgets/custom_drop_down_menu.dart';
import '../../../../../shared/widgets/role_model_appbar_widget.dart';
import '../../../../auth/methods/input_decoration.dart';

class AddNewAddressPage extends StatelessWidget {
  const AddNewAddressPage({super.key});

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
                    'ADD NEW ADDRESS',
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
            flex: 3,
            child: ListView(
              padding: pad24All,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'ADDRESS LINE 1',
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
                        hintText: 'Address'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    'ADDRESS LINE 2',
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
                        hintText: 'Address'),
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
                            'ZIP CODE',
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
                                    hintText: '000-000'),
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
                            'CITY',
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
                                    hintText: 'CITY'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'CITY',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: ColorsHelper.primary,
                    ),
                  ),
                ),
                CustomDropDownMenu(
                  optionList: countryList,
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
                Navigator.pushNamed(
                  context,
                  RouterHelper.addNewAddressesPage,
                );
              },
              child: const Text('ADD NEW ADDRESS'),
            ),
          )
          //Bottom button [END]
        ],
      ),
      bottomNavigationBar: const SharedBottomNavLayout(currentIndex: -1),
    );
  }
}
