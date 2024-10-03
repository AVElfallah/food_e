import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/assets_helper.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/shared/layouts/shared_bottom_nav_layout.dart';

import 'widgets/basket_component_widget.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          //AppBar [START]
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'BASKET',
                style: context.textTheme.headlineLarge,
              ),
            ),
          ),
          //AppBar [END]

          // Basket body [START]
          Container(
            height: height * .6,
            margin: EdgeInsets.only(top: height * .14),
            child: ListView(
              children: const [
                BasketComponentWidget(
                    price: 60,
                    assetImage: AssetsHelper.mealOfBreadImage,
                    name: 'Bread'),
                BasketComponentWidget(),
                BasketComponentWidget(
                    price: 60,
                    assetImage: AssetsHelper.mealOfBreadImage,
                    name: 'Bread'),
                BasketComponentWidget(),
                BasketComponentWidget(
                    price: 60,
                    assetImage: AssetsHelper.mealOfBreadImage,
                    name: 'Bread'),
              ],
            ),
          ),

          //Basket body [END]

          //check out button [START]
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: height * .14,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$ 65.00',
                      style: context.textTheme.headlineLarge?.copyWith(
                        color: ColorsHelper.secondary,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //TODO -  add checkout button action
                        Navigator.of(context)
                            .pushNamed(RouterHelper.checkoutPage);
                      },
                      child: const Text(
                        'PROCEED TO CHECKOUT',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          //Check out button [END]
        ],
      ),
      bottomNavigationBar: const SharedBottomNavLayout(currentIndex: 2),
    );
  }
}
