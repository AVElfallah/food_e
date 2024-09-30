import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/role_model_appbar_widget.dart';
import '../../../shared/widgets/upper_text_label.dart';

class PaymentSetupPage extends StatelessWidget {
  const PaymentSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    var canvasWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Payment SETUP',
              style: GoogleFonts.bebasNeue(
                fontSize: 34,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          //start address
          const UpperTextLabel('CARD NUMBER'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: SizedBox(
              height: 45,
              child: TextFormField(
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
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
          const SizedBox(
            height: 30,
          ),

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
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                      ),
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
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                      ),
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

          const SizedBox(
            height: 30,
          ),
          //
          const SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Add Card',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              ),
              child: const Text(
                'Skip for now',
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
