import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/shared/constants/constant_sizedboxes.dart';

import '../../../shared/widgets/role_model_appbar_widget.dart';
import '../../../shared/widgets/upper_text_label.dart';
import '../../../shared/constants/constant_padding.dart';

class PaymentSetupPage extends StatelessWidget {
  const PaymentSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    var canvasWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: ListView(
        children: [
          Padding(
            padding: pad15All,
            child: Text(
              'Payment SETUP',
              style: context.textTheme.headlineLarge,
            ),
          ),

          SizedBox(height: context.height * .25),

          //start address
          const UpperTextLabel('CARD NUMBER'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: SizedBox(
              height: 45,
              child: TextFormField(
                style:
                    context.textTheme.bodyMedium!.copyWith(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'XXXX - XXXX - XXXX',
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
                    'EXPIRY DATE',
                  ),
                  SizedBox(
                    height: 45,
                    width: canvasWidth * .42,
                    child: TextFormField(
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'MM / YY',
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
                    'CVV',
                  ),
                  SizedBox(
                    height: 45,
                    width: canvasWidth * .45,
                    child: TextFormField(
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: '000',
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
          h40SizedBox,
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Add Card',
              ),
            ),
          ),
          h20SizedBox,
          Center(
            child: TextButton(
              onPressed: () {},
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
