import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/controllers/fav_page_controller.dart';
import 'package:food_e/controllers/riverpod_objects/riverpod_objects.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../shared/layouts/shared_bottom_nav_layout.dart';
import 'widgets/liked_component_widget.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  ConsumerState createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final refWatch = ref.watch<FavPageController>(favPageController);
    return Scaffold(
      body: Stack(
        children: [
          //AppBar [START]
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text('LIKED', style: context.textTheme.headlineLarge),
            ),
          ),
          //AppBar [END]

          // Basket body [START]
          Container(
            height: context.height * .8,
            margin: EdgeInsets.only(top: context.height * .14),
            child: Skeletonizer(
              ignoreContainers: true,
              enabled: refWatch.products.isEmpty,
              child: ListView.builder(
                // show skeleton if products is empty at the first time
                // this skeleton will be replaced with real data after loading
                // but if there is data
                itemCount:
                    (refWatch.products.isEmpty ? 3 : refWatch.products.length),
                itemBuilder: (context, index) {
                  return refWatch.products.isEmpty
                      ? const LikedComponentWidget()
                      : LikedComponentWidget(
                          mealModel: refWatch.products[index],
                        );
                },
              ),
            ),
          ),

          //Basket body [END]
        ],
      ),
      bottomNavigationBar: const SharedBottomNavLayout(currentIndex: 3),
    );
  }
}
