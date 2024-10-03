import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/assets_helper.dart';
import 'package:food_e/helpers/colors_helper.dart';

class AddsBannerWidget extends StatelessWidget {
  const AddsBannerWidget({
    super.key,
    this.sale,
    this.saleCode,
    this.backgroundColor,
    this.foregroundColor,
    this.saleColor,
  });

  final double? sale;
  final String? saleCode;
  final Color? backgroundColor;
  final Color? foregroundColor;
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
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: foregroundColor ?? Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: sale != null ? '$sale%' : '50% ',
                      style: context.textTheme.headlineLarge?.copyWith(
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
                style: context.textTheme.bodySmall?.copyWith(
                  color: foregroundColor ?? Colors.white,
                ),
              ),
              Text(
                saleCode != null ? '$saleCode%' : 'NEW50',
                style: context.textTheme.headlineLarge?.copyWith(
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
