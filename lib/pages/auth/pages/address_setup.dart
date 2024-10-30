import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/shared/constants/constant_lists.dart';
import 'package:food_e/shared/constants/constant_sizedboxes.dart';

import '../../../shared/constants/constant_padding.dart';
import '../../../shared/widgets/custom_drop_down_menu.dart';
import '../../../shared/widgets/role_model_appbar_widget.dart';
import '../../../shared/widgets/upper_text_label.dart';

class AddressSetup extends StatelessWidget {
  const AddressSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: ListView(
        children: [
          Padding(
            padding: pad15All,
            child: Text(
              'ADDRESS SETUP',
              style: context.textTheme.headlineLarge,
            ),
          ),
          SizedBox(
            height: context.height * .05,
          ),
          //start address
          const UpperTextLabel('ADDRESS LINE 1'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: SizedBox(
              height: 45,
              child: TextFormField(
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Address',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),

          /// end address
          h20SizedBox,
          //start address
          const UpperTextLabel('ADDRESS LINE 2'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: SizedBox(
              height: 45,
              child: TextFormField(
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Address',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),

          /// end address
          h30SizedBox,

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //zip code
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UpperTextLabel(
                    'Zip code',
                  ),
                  SizedBox(
                    height: 45,
                    width: context.width * .42,
                    child: TextFormField(
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: '000-000',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //end zip code
              //city code
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UpperTextLabel(
                    'City',
                  ),
                  SizedBox(
                    height: 45,
                    width: context.width * .45,
                    child: TextFormField(
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'City',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //end zip code
            ],
          ),
          //End row

          h30SizedBox,
          //
          //Drop down list of countries

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomDropDownMenu(
              optionList: countryList,
            ),
          ),

          h40SizedBox,
          Center(
            child: ElevatedButton(
              onPressed: () {
                //TODO - add address function here
                Navigator.of(context)
                    .pushReplacementNamed(RouterHelper.paymentSetupPage);
              },
              child: const Text(
                'Add Address',
              ),
            ),
          ),
          h20SizedBox,
          Center(
            child: TextButton(
              onPressed: () {
                //TODO - add skip for now here
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: context.textTheme.bodyMedium!,
              ),
              child: const Text(
                'Skip for now',
              ),
            ),
          ),
          h40SizedBox,
        ],
      ),
    );
  }
}
