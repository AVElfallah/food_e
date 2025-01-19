import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_e/extensions/context_extension.dart';

import '../../../controllers/riverpod_objects/riverpod_objects.dart';
import '../../../controllers/search_page_controller.dart';
import '../../../helpers/assets_helper.dart';
import '../../../helpers/colors_helper.dart';
import '../../../shared/widgets/upper_text_label.dart';

class SearchHistoryLayout extends ConsumerWidget {
  const SearchHistoryLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refSearchPageController =
        ref.watch<SearchPageController>(searchPageController);
    return Column(// ListView to display the search history

        children: [
      //Search history [START]
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              refSearchPageController.clearAllSearchHistory();
            },
            child: const UpperTextLabel('CLEAR ALL'),
          ),
        ),
      ),
      ...[
        for (var item in refSearchPageController.searchHistory)
          ListTile(
            onTap: () {
              refSearchPageController.selectQueryFromSearchHistory(item);
            },
            leading: SvgPicture.asset(
              AssetsHelper.historyIcon,
            ),
            title: Text(
              item,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: ColorsHelper.gray),
            ),
            trailing: InkWell(
                onTap: () {
                  refSearchPageController.clearElementFromSearchHistory(item);
                },
                child: SvgPicture.asset(AssetsHelper.xIcon)),
          )
      ],

      //Search History [END]
    ]);
  }
}
