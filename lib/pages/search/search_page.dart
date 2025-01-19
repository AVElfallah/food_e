import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/controllers/search_page_controller.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/pages/auth/methods/input_decoration.dart';
import 'package:food_e/pages/search/layouts/search_history_layout.dart';
import 'package:food_e/shared/widgets/upper_text_label.dart';

import '../../controllers/riverpod_objects/riverpod_objects.dart';
import '../../helpers/debouncer.dart';
import '../../shared/layouts/shared_bottom_nav_layout.dart';
import 'layouts/categories_chips_layouts.dart';
import 'widgets/search_card_result_widget.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final refSearchPageController =
        ref.watch<SearchPageController>(searchPageController);
    var canvasHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //Search bar [START]
          SliverToBoxAdapter(
            child: SizedBox(
              height: canvasHeight * .24,
              child: Padding(
                padding: EdgeInsets.only(
                  top: canvasHeight * .08,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UpperTextLabel('SEARCH'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: TextFormField(
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                        focusNode: refSearchPageController.fNode,
                        controller: refSearchPageController.searchController,
                        onChanged: (sText) {
                          final Debouncer debouncer =
                              Debouncer(milliseconds: 900);

                          debouncer.run(() {
                            refSearchPageController.searchForProduct();
                          });
                        },
                        decoration: CustomInputDecoration.basicTextFormField(
                          context,
                          hintText: 'Cuisine / Dish',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: !refSearchPageController
                                  .isSearchQueryEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    refSearchPageController.searchController
                                        .clear();
                                    refSearchPageController.isSearchQueryEmpty =
                                        true;
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: ColorsHelper.primary,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Search bar [END]

          //Categories chips [START]

          // in this section the condition is applied if search box is not focused
          // and search query must be empty to show categories chips
          if (!refSearchPageController.searchBoxIsFocused &&
              refSearchPageController.searchResult.isEmpty) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    refSearchPageController.clearSelectedCategories();
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: UpperTextLabel('Remove Filters'),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CustomGridView(
                items: refSearchPageController.categories,
              ),
            ),
          ],
          //Categories chips [END]

          //Selected categories chips [START]
          if (refSearchPageController.selectedCategories.isNotEmpty &&
              refSearchPageController.searchBoxIsFocused) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    refSearchPageController.clearSelectedCategories();
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: UpperTextLabel('Remove Selected'),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CustomGridView(
                isFilters: false,
                items: refSearchPageController.selectedCategories,
              ),
            ),
          ],
          //Selected categories chips [END]

          //Result [START]
          if (refSearchPageController.searchResult.isNotEmpty)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: UpperTextLabel('RESULTS'),
                ),
              ),
            ),
          if (refSearchPageController.searchResult.isNotEmpty)
            SliverToBoxAdapter(
              child: SizedBox(
                height: context.height * .38,
                width: context.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SearchCardResultWidget(
                      mealModel: refSearchPageController.searchResult[index],
                      height: context.height * .35,
                      width: context.width * .55,
                    );
                  },
                  itemCount: refSearchPageController.searchResult.length,
                ),
              ),
            ),
          /* SliverFillRemaining(
              hasScrollBody: true,
              child: SizedBox(
                height: 200,
                width: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: refSearchPageController.searchResult.length,
                  itemBuilder: (context, index) {
                    return SearchCardResultWidget(
                      mealModel: refSearchPageController.searchResult[index],
                    );
                  },
                ),
              ),
            ), */

          //Result [END]

          //Search history [START]
          const SliverToBoxAdapter(child: SearchHistoryLayout()),
          //Search history [END]
        ],
      ),
      bottomNavigationBar: const SharedBottomNavLayout(
        currentIndex: 1,
      ),
    );
  }
}
