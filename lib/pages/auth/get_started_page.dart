import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/shared/constants/constant_padding.dart';
import 'package:food_e/shared/constants/constant_sizedboxes.dart';

import '../../../helpers/colors_helper.dart';
import '../../../shared/constants/constant_string.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    final canvasHeight = MediaQuery.of(context).size.height;
    final canvasWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: canvasHeight * .06,
            left: canvasWidth * .055,
            child: Hero(
              tag: foodELogoHeroTag,
              child: Text.rich(
                TextSpan(
                  text: 'Food-',
                  style: context.textTheme.headlineMedium,
                  children: [
                    TextSpan(
                      text: 'E',
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: ColorsHelper.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Logo end

          Positioned(
            top: canvasHeight * .1,
            child: SizedBox(
              height: canvasHeight - (canvasHeight * .1),
              width: canvasWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  h50SizedBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text.rich(
                      const TextSpan(
                        text: 'Get',
                        children: [
                          TextSpan(
                            text: ' Started',
                            style: TextStyle(
                              color: ColorsHelper.primary,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                      style: context.textTheme.headlineLarge,
                    ),
                  ),
                  const Padding(
                    padding: pad22All,
                    child: Text(
                      'Get started and enjoy the awesome local food right at your home.',
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouterHelper.loginPage);
                      },
                      child: const Text(
                        'Login',
                      ),
                    ),
                  ),
                  h20SizedBox,
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          RouterHelper.registerPage,
                        );
                      },
                      child: const Text(
                        'REGISTER',
                      ),
                    ),
                  ),
                  h20SizedBox
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
