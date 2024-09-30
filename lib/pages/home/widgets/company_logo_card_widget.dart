import 'package:flutter/material.dart';

import '../../../helpers/assets_helper.dart';

class CompanyLogoCardWidget extends StatelessWidget {
  const CompanyLogoCardWidget(
      {super.key, this.imageURL, this.isNetworkImage = false});
  final String? imageURL;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
        image: DecorationImage(
          image: !isNetworkImage
              ? AssetImage(
                  imageURL ?? AssetsHelper.macImage,
                )
              : NetworkImage(
                  imageURL ??
                      'https://cdn0.iconfinder.com/data/icons/shift-free/32/Error-512.png',
                ),
          fit: BoxFit.cover,
        ),
      ),
      width: 80,
      height: 80,
      margin: const EdgeInsets.all(15),
    );
  }
}
