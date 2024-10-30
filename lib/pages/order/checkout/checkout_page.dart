import 'package:flutter/material.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/shared/layouts/shared_bottom_nav_layout.dart';
import 'package:food_e/shared/widgets/role_model_appbar_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/constants/constant_padding.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: RoleModelAppbarWidget(
        context,
        leadingIcon: Icons.arrow_back_ios_new,
      ),
      body: Stack(
        children: [
          //Page Title [START]
          Positioned(
            left: 10,
            child: Text(
              'CHECKOUT',
              style: GoogleFonts.bebasNeue(
                fontSize: 36,
                color: Colors.white,
              ),
            ),
          ),
          //Page Title [END]

          //Page Content [START]
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * .50,
              width: double.infinity,
              padding: pad14All,
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Price Text [START]
                  Text(
                    'PRICE',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '\$ 65.00',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 36,
                      color: ColorsHelper.primary,
                    ),
                  ),
                  //Price  Text [END]
                  SizedBox(
                    height: height * .08,
                  ),
                  //Address [START]
                  Text(
                    "DELIVER TO",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Home",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorsHelper.secondary,
                          ),
                        ),
                      )
                    ],
                  ),
                  //Address [END]
                  const SizedBox(
                    height: 20,
                  ),
                  //Payment [START]
                  Text(
                    "PAYMENT METHOD",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "XXXX XXXX XXXX 2538",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorsHelper.secondary,
                          ),
                        ),
                      )
                    ],
                  ),
                  //Payment [END]
                  const Spacer(),
                  //Checkout button [START]
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('CONFIRM ORDER'),
                  ),
                  //Checkout button [END]
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          )
          //Page Content [END]
        ],
      ),
      bottomNavigationBar: const SharedBottomNavLayout(currentIndex: -1),
    );
  }
}
