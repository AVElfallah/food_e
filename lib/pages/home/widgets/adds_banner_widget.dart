import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/assets_helper.dart';
import 'package:food_e/helpers/colors_helper.dart';

import '../../../shared/constants/constant_padding.dart';

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
        InkWell(
          onTap: () async {
            // copy code to clipboard and notify user if it was successful
            Clipboard.setData(ClipboardData(text: saleCode ?? 'NEW50'));
            // show snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Copied to clipboard'),
                backgroundColor: Colors.green,
              ),
            );
          },
          child: Container(
            width: canvasWidth,
            height: canvasHeight * .25,
            decoration: BoxDecoration(
              color: backgroundColor ?? ColorsHelper.primaryLight,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            padding: pad20All,
            margin: pad15All,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: RichText(
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
                ),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    'use code on checkout',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: foregroundColor ?? Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    saleCode != null ? '$saleCode%' : 'NEW50',
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: saleColor ?? ColorsHelper.dark,
                    ),
                  ),
                )
              ],
            ),
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
