import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/assets_helper.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/model/meal_model.dart';
import 'package:food_e/shared/widgets/custom_bottom_nav_widget.dart';
import 'package:food_e/shared/widgets/upper_text_label.dart';
import '../../../shared/constants/constant_padding.dart';

class MealPage extends StatelessWidget {
  const MealPage({super.key});

  @override
  Widget build(BuildContext context) {
    MealModel mealModel =
        ModalRoute.of(context)!.settings.arguments as MealModel;
    int quantity = 1;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //AppBar [START]
          SliverAppBar(
            //LEADING [START]
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              splashColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                margin: pad12All,
                padding: const EdgeInsets.only(left: 8),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                ),
              ),
            ),
            //LEADING [END]
            expandedHeight: context.height * .35,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
              mealModel.images![0],
              width: context.width,
              height: context.height * .25,
              fit: BoxFit.fill,
            )),
          ),
          //AppBar [END]

          //Slivers body [START]
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                const SizedBox(
                  height: 15,
                ),
                //Row [START]
                Padding(
                  padding: pad10All,
                  child: Flex(
                    direction: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        mealModel.name!,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: ColorsHelper.secondary,
                        ),
                      ),
                      const Spacer(),
                      Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            AssetsHelper.clockIcon,
                            height: 25,
                          ),
                          Text(
                            '${mealModel.preparingTime} mins',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: ColorsHelper.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                //ROW [END]
                ,
                const SizedBox(
                  height: 20,
                ),
                //Description of meal [START]
                Padding(
                  padding: pad10All,
                  child: Text(
                    mealModel.description ?? '',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: ColorsHelper.gray,
                    ),
                  ),
                ),
                //Description of meal [END]
                const SizedBox(
                  height: 40,
                ),
                //Quantity [START]
                const UpperTextLabel('QUANTITY'),
                StatefulBuilder(builder: (ctx, stateBuilder) {
                  return Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: context.height * .05,
                        width: context.width * .45,
                        margin: const EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              quantity.toString(),
                              style: context.textTheme.labelMedium
                                  ?.copyWith(color: Colors.black),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                stateBuilder(() {
                                  quantity--;
                                  quantity < 1 ? quantity = 0 : quantity;
                                });
                              },
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.transparent,
                              ),
                              icon: SvgPicture.asset(
                                AssetsHelper.minusIcon,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                stateBuilder(() {
                                  quantity++;
                                });
                              },
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.transparent,
                              ),
                              icon: SvgPicture.asset(
                                AssetsHelper.addIcon,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          '\$ ${(mealModel.price! * quantity).toStringAsFixed(2)}',
                          style: context.textTheme.headlineMedium?.copyWith(
                            color: ColorsHelper.primary,
                          ),
                        ),
                      )
                    ],
                  );
                }),

                //Quantity [END]
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: pad15All,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'ADD TO BASKET',
                    ),
                  ),
                )
              ],
            ),
          )
          //Slivers body [END]
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        selectedColor: ColorsHelper.primary,
        unselectedColor: Colors.white,
        svgIcons: [
          AssetsHelper.homeIcon,
          AssetsHelper.searchIcon,
          AssetsHelper.basketIcon,
          AssetsHelper.heartIcon,
          AssetsHelper.personIcon,
        ],
      ),
    );
  }
}
