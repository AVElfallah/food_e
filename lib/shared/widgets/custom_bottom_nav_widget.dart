import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_e/controllers/riverpod_objects/riverpod_objects.dart';
import 'package:food_e/helpers/colors_helper.dart';

// CustomBottomNavigationBar is a custom widget that displays a bottom navigation bar with SVG icons.
class CustomBottomNavigationBar extends ConsumerStatefulWidget {
  final List<String> svgIcons; // List of SVG icon paths
  final Color selectedColor; // Color for the selected icon
  final Color unselectedColor; // Color for the unselected icons
  // final Color? backgroundColor; // Background color of the navigation bar
  final bool showElevation; // Whether to show elevation (shadow) or not
  final ValueNotifier<int>? selectedIndex; // Notifier for the selected index

  final void Function(int)?
      onChangeSelection; // Callback when an icon is selected

  const CustomBottomNavigationBar({
    super.key,
    required this.svgIcons,
    required this.selectedColor,
    required this.unselectedColor,
    // this.backgroundColor = ColorsHelper.dark,
    this.showElevation = false,
    this.selectedIndex,
    this.onChangeSelection,
  });

  @override
  ConsumerState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends ConsumerState<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  final mainAppProvider = mainAppController;
  // Animation controller for the animation
  late AnimationController _controller;
  // Animation for the selected indicator
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller with a duration of 500 milliseconds
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Slower animation
      vsync: this,
    );
    // Define the animation from 0 to 1
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      _controller,
    );
  }

  @override
  void dispose() {
    // Dispose the animation controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List of SVG icons
    var listOfSvgIcons = widget.svgIcons;

    // Function to handle icon tap
    void onItemTapped(int index) {
      widget.selectedIndex?.value = index; // Update the selected index
      _controller.forward(from: 0); // Start the animation
    }

    final watchRefOfApp = ref.watch(mainAppProvider);

    return Hero(
      tag: 'bottomNAV_TAG', // Hero tag for animation between screens
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 10), // Padding for the container
        decoration: BoxDecoration(
          color: watchRefOfApp.isDarkMode
              ? ColorsHelper.dark
              : ColorsHelper.light, // Background color of the navigation bar
          boxShadow: widget.showElevation
              ? const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ]
              : [], // Show shadow if showElevation is true
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // Space icons evenly
          children: [
            // Loop through the list of SVG icons to create navigation items
            for (var idx = 0; idx < listOfSvgIcons.length; idx++)
              // Use ValueListenableBuilder to rebuild the widget when selectedIndex changes
              ValueListenableBuilder<int>(
                  valueListenable: widget.selectedIndex ?? ValueNotifier(-1),
                  builder: (context, val, wid) {
                    String iconPath =
                        listOfSvgIcons[idx]; // Path of the current icon
                    bool isSelected =
                        val == idx; // Check if the current icon is selected

                    return GestureDetector(
                      onTap: () {
                        onItemTapped(idx); // Handle icon tap
                        widget.onChangeSelection
                            ?.call(idx); // Call the callback function
                      },
                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 500,
                        ), // Slower animation
                        curve: Curves.easeInOut, // Animation curve
                        child: Column(
                          mainAxisSize:
                              MainAxisSize.min, // Minimize the main axis size
                          children: [
                            SvgPicture.asset(
                              iconPath,
                              // ignore: deprecated_member_use
                              color: isSelected
                                  ? widget.selectedColor
                                  //this is a bad using in customize i just use it in this solution only
                                  : (watchRefOfApp.isDarkMode
                                      ? widget.unselectedColor
                                      : ColorsHelper
                                          .dark), // Set icon color based on selection
                              width: 25,
                              height: 25,
                              fit: BoxFit
                                  .fill, // Fit the icon within the given size
                            ),
                            const SizedBox(
                                height: 5), // Space between icon and indicator
                            AnimatedBuilder(
                              animation:
                                  _animation, // Use the defined animation
                              builder: (context, child) {
                                return Center(
                                  child: Container(
                                    width: 8,
                                    height: 2,
                                    color: (isSelected
                                        ? widget.selectedColor
                                        : Colors
                                            .transparent), // Show indicator if selected
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  })
          ],
        ),
      ),
    );
  }
}
