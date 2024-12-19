import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:food_e/helpers/colors_helper.dart';

import 'package:food_e/pages/home/widgets/adds_banner_widget.dart';

class AddsBannersLayouts extends StatelessWidget {
  const AddsBannersLayouts({super.key});

  @override
  Widget build(BuildContext context) {
    var canvasHeight = MediaQuery.of(context).size.height;
    return ImageSlideshow(
   
      isLoop: true,
      indicatorPadding: 10,
      indicatorBottomPadding: 0,
      height: canvasHeight * .3,
      children: const [
        AddsBannerWidget(
          backgroundColor: ColorsHelper.secondary,
        ),
        AddsBannerWidget(),
        AddsBannerWidget(
          backgroundColor: ColorsHelper.alertSuccess,
        ),
      ],
    );
  }
}
