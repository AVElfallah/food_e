import 'package:flutter/material.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeCustomAppbarWidget._({super.key, required this.preferredSize});

  factory HomeCustomAppbarWidget({Key? key, Size? barSize}) {
    final Size pSize = barSize ?? const Size.fromHeight(100);
    return HomeCustomAppbarWidget._(
      key: key,
      preferredSize: pSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
        child: Row(
          children: [
            Text.rich(
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              TextSpan(
                text: 'Hello, ',
                children: [
                  TextSpan(
                    text: 'john',
                    style: GoogleFonts.poppins(
                      color: ColorsHelper.primary,
                    ),
                  ),
                  const TextSpan(text: ' !')
                ],
              ),
            ),
            const Spacer(),
            Text(
              'Home',
              style: GoogleFonts.bebasNeue(
                color: ColorsHelper.secondary,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Icon(
              Icons.location_pin,
              color: ColorsHelper.secondary,
            )
          ],
        ),
      ),
    );
  }

  @override
  final Size preferredSize;
}
