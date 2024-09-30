import 'package:flutter/material.dart';
import 'package:food_e/helpers/router_helper.dart';

import '../../helpers/assets_helper.dart';
import '../../helpers/colors_helper.dart';
import '../widgets/custom_bottom_nav_widget.dart';

// This is a custom Layout which is used a list of route paths
class SharedBottomNavLayout extends StatefulWidget {
  const SharedBottomNavLayout({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  State<SharedBottomNavLayout> createState() => _SharedBottomNavLayoutState();
}

class _SharedBottomNavLayoutState extends State<SharedBottomNavLayout> {
  final List<String> uiPaths = [
    RouterHelper.homePage,
    RouterHelper.searchPage,
    RouterHelper.basketPage,
    RouterHelper.favoritePage,
    RouterHelper.profilePage,
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBottomNavigationBar(
      selectedIndex: ValueNotifier(widget.currentIndex),
      selectedColor: ColorsHelper.primary,
      unselectedColor: Colors.white,
      onChangeSelection: (index) {
        if (index == widget.currentIndex) return;
        Navigator.of(context).pushReplacementNamed(uiPaths[index]);
      },
      svgIcons: const [
        AssetsHelper.homeIcon,
        AssetsHelper.searchIcon,
        AssetsHelper.basketIcon,
        AssetsHelper.heartIcon,
        AssetsHelper.personIcon,
      ],
    );
  }
}
