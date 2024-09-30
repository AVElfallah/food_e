import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_e/helpers/assets_helper.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/shared/widgets/upper_text_label.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/layouts/shared_bottom_nav_layout.dart';
import 'layouts/categories_chips_layouts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final FocusNode fNode;
  late final TextEditingController searchController;
  bool searchBoxIsFocused = false;
  bool isSearchQueryEmpty = true;

  @override
  void initState() {
    super.initState();
    fNode = FocusNode();
    searchController = TextEditingController();
    fNode.addListener(() {
      if (fNode.hasFocus) {
        searchBoxIsFocused = true;

        setState(() {});
      } else {
        searchBoxIsFocused = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var canvasHeight = MediaQuery.of(context).size.height;
    final historySearch = [
      'Biryani',
      'Dosa',
      'Veg Pakoda',
      'Chicken Tikka',
      'Tandoori',
      'Falooda',
    ];

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
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                        focusNode: fNode,
                        controller: searchController,
                        onChanged: (sText) {
                          setState(() {
                            isSearchQueryEmpty = sText.isEmpty;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Cuisine / Dish',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: !isSearchQueryEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    searchController.clear();
                                    isSearchQueryEmpty = true;
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: ColorsHelper.primary,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
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
          if (!searchBoxIsFocused && isSearchQueryEmpty) ...[
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: UpperTextLabel('VIEW ALL'),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomGridView(
                items: [
                  'Breakfast',
                  'Fastfood',
                  'Lunch',
                  'South Indian',
                  'North Indian',
                  'Dinner',
                  'Pure Veg',
                  'Non Veg',
                ],
              ),
            ),
          ],
          //Categories chips [END]

//Search history [START]
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: UpperTextLabel('CLEAR ALL'),
              ),
            ),
          ),
          SliverList.builder(
            itemCount: historySearch.length,
            itemBuilder: (ctx, index) => ListTile(
              leading: SvgPicture.asset(
                AssetsHelper.historyIcon,
              ),
              title: Text(
                historySearch[index],
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: ColorsHelper.gray,
                ),
              ),
              trailing: SvgPicture.asset(AssetsHelper.xIcon),
            ),
          )
          //Search History [END]
        ],
      ),
      bottomNavigationBar: const SharedBottomNavLayout(
        currentIndex: 1,
      ),
    );
  }
}
