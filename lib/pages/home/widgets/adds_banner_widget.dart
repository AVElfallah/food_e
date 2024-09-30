import 'package:flutter/material.dart';
import 'package:food_e/helpers/assets_helper.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class AddsBannerWidget extends StatelessWidget {
  const AddsBannerWidget({
    super.key,
    this.sale,
    this.saleCode,
    this.backgroundColor,
    this.forgroundColor,
    this.saleColor,
  });

  final double? sale;
  final String? saleCode;
  final Color? backgroundColor;
  final Color? forgroundColor;
  final Color? saleColor;

  @override
  Widget build(BuildContext context) {
    var canvasWidth = MediaQuery.of(context).size.width;
    var canvasHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: canvasWidth,
          height: canvasHeight * .22,
          decoration: BoxDecoration(
            color: backgroundColor ?? ColorsHelper.primaryLight,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Get ',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 24,
                    fontWeight: FontWeight.w200,
                    color: forgroundColor ?? Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: sale != null ? '$sale%' : '50% ',
                      style: TextStyle(
                        fontSize: 36,
                        color: saleColor ?? ColorsHelper.dark,
                      ),
                    ),
                    const TextSpan(text: 'AS A Joining Bonus')
                  ],
                ),
              ),
              const Spacer(),
              Text(
                'use code on checkout',
                style: GoogleFonts.bebasNeue(
                  fontSize: 12,
                  color: forgroundColor ?? Colors.white,
                ),
              ),
              Text(
                saleCode != null ? '$saleCode%' : 'NEW50',
                style: GoogleFonts.bebasNeue(
                  fontSize: 36,
                  color: saleColor ?? ColorsHelper.dark,
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset(
              AssetsHelper.handImage,
            ),
          ),
        ),
      ],
    );
  }
}
