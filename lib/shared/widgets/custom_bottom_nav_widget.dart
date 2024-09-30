import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_e/helpers/colors_helper.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<String> svgIcons;
  final Color selectedColor;
  final Color unselectedColor;
  final Color? backgroundColor;
  final bool showElevation;
  final ValueNotifier<int>? selectedIndex;

  final void Function(int)? onChangeSelection;

  const CustomBottomNavigationBar({
    super.key,
    required this.svgIcons,
    required this.selectedColor,
    required this.unselectedColor,
    this.backgroundColor = ColorsHelper.dark,
    this.showElevation = false,
    this.selectedIndex,
    this.onChangeSelection,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  //int _selectedIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Slower animation
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var listOfSvgIcons = widget.svgIcons;
    void onItemTapped(int index) {
      widget.selectedIndex?.value = index;
      _controller.forward(from: 0);
    }

    return Hero(
      tag: 'bottomNAV_TAG',
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          boxShadow: widget.showElevation
              ? const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Summery this is  a for loop that looping in [listOfSvgIcons]
            //to print the icons on screen
            // [idx] is the index of loop
            for (var idx = 0; idx < listOfSvgIcons.length; idx++)
              //Start internal for [START]
              ValueListenableBuilder<int>(
                  valueListenable: widget.selectedIndex ?? ValueNotifier(-1),
                  builder: (context, val, wid) {
                    String iconPath = listOfSvgIcons[idx];
                    bool isSelected = val == idx;

                    return GestureDetector(
                      onTap: () {
                        onItemTapped(idx);
                        widget.onChangeSelection?.call(idx);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 500,
                        ), // Slower animation
                        curve: Curves.easeInOut,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              iconPath,
                              color: isSelected
                                  ? widget.selectedColor
                                  : widget.unselectedColor,
                              width: 25,
                              height: 25,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(height: 5),
                            AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return Center(
                                  child: Container(
                                    width: 8,
                                    height: 2,
                                    color: isSelected
                                        ? widget.selectedColor
                                        : Colors.transparent,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            //End internal for [END]
          ],
        ),
      ),
    );
  }
}
