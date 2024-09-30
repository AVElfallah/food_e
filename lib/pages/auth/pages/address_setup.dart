import 'package:flutter/material.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/shared/constants/constant_lists.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/role_model_appbar_widget.dart';
import '../../../shared/widgets/upper_text_label.dart';

class AddressSetup extends StatelessWidget {
  const AddressSetup({super.key});

  @override
  Widget build(BuildContext context) {
    var canvasWidth = MediaQuery.of(context).size.width;
    var canvasHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: RoleModelAppbarWidget(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'ADDRESS SETUP',
              style: GoogleFonts.bebasNeue(
                fontSize: 34,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          //start address
          const UpperTextLabel('ADDRESS LINE 1'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: SizedBox(
              height: 45,
              child: TextFormField(
                style: GoogleFonts.poppins(
                  fontSize: 14,
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
          const SizedBox(
            height: 20,
          ),
          //start address
          const UpperTextLabel('ADDRESS LINE 2'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: SizedBox(
              height: 45,
              child: TextFormField(
                style: GoogleFonts.poppins(
                  fontSize: 14,
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
                    'Zip code',
                  ),
                  SizedBox(
                    height: 45,
                    width: canvasWidth * .42,
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                        fontSize: 14,
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
                    width: canvasWidth * .45,
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                        fontSize: 14,
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

          const SizedBox(
            height: 30,
          ),
          //
          //Drop down list of countries
          Center(
            child: DropdownMenu<String>(
              dropdownMenuEntries: countryList
                  .map(
                    (cun) => DropdownMenuEntry(value: cun, label: cun),
                  )
                  .toList(),
              hintText: 'Country',
              textStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              menuHeight: canvasHeight * .35,
              width: canvasWidth * .89,
            ),
          ),

          const SizedBox(
            height: 40,
          ),
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
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton(
              onPressed: () {
                //TODO - add skip for now here
              },
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
