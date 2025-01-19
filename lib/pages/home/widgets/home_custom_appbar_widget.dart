import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';

import '../../../controllers/riverpod_objects/riverpod_objects.dart';

class HomeCustomAppbarWidget extends ConsumerWidget
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
  Widget build(BuildContext context, WidgetRef ref) {
    final watchHomePageProvider = ref.watch(homePageController);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
        child: Row(
          children: [
            SizedBox(
              width: context.width * .6,
              child: Text.rich(
                style: context.textTheme.bodyLarge!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                TextSpan(
                  text: 'Hello, ',
                  children: [
                    TextSpan(
                      text: watchHomePageProvider.userName,
                      style: context.textTheme.bodyLarge!.copyWith(
                        color: ColorsHelper.primary,
                      ),
                    ),
                    const TextSpan(text: ' !')
                  ],
                ),
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
