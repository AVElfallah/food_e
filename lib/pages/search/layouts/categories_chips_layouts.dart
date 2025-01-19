import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/controllers/search_page_controller.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/model/category_model.dart';

import '../../../controllers/riverpod_objects/riverpod_objects.dart';

class CustomGridView extends ConsumerWidget {
  final List<CategoryModel> items; // List of items to display in the grid view
  final bool
      isFilters; // Boolean value to determine if the grid view is for filters

  const CustomGridView({super.key, required this.items, this.isFilters = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchPageProvider =
        ref.watch<SearchPageController>(searchPageController);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        alignment: isFilters ? WrapAlignment.spaceAround : WrapAlignment.start,
        children: items.map((category) {
          return Chip(
            label: Text(category.name ?? ''),
            labelPadding: EdgeInsets.symmetric(
                horizontal:
                    searchPageProvider.selectedCategories.contains(category)
                        ? 30
                        : 10),
            backgroundColor:
                searchPageProvider.selectedCategories.contains(category)
                    ? ColorsHelper.primary
                    : Theme.of(context).chipTheme.backgroundColor,
            onDeleted: () {
              searchPageProvider.selectCategory(category);
            },
            deleteIcon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
            avatar: category.imageUrl != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(category.imageUrl!),
                  )
                : null,
            elevation: 2,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          );
        }).toList(),
      ),
    );
  }
}
