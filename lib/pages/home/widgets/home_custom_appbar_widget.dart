import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';

class HomeCustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeCustomAppbarWidget._({super.key, required this.preferredSize});

  factory HomeCustomAppbarWidget({Key? key, Size? barSize}) {
    final Size pSize = barSize ?? const Size.fromHeight(100);
    return HomeCustomAppbarWidget._(
      key: key,
      preferredSize: pSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
        child: Row(
          children: [
            Text.rich(
              style: context.textTheme.bodyLarge!,
              TextSpan(
                text: 'Hello, ',
                children: [
                  TextSpan(
                    text: 'john',
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: ColorsHelper.primary,
                    ),
                  ),
                  const TextSpan(text: ' !')
                ],
              ),
            ),
            const Spacer(),
            Text(
              'Home',
              style: context.textTheme.labelSmall!.copyWith(
                color: ColorsHelper.secondary,
              ),
            ),
            const Icon(
              Icons.location_pin,
              color: ColorsHelper.secondary,
            )
          ],
        ),
      ),
    );
  }

  @override
  final Size preferredSize;
}
