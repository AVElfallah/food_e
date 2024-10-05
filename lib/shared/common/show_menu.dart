import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';

///
///
showOptionMenu(
    BuildContext
        context, // The context of the widget that will display the popup menu
    {required GlobalKey?
        widgetKey, // The key of the widget above which the popup menu will be displayed
    required TextEditingController?
        txtController, // The text controller that will be updated with the selected option
    required AnimationController? animationController,
    List<String> listOptions = const []}) async {
  // The animation controller that will be reversed when the popup menu is closed
  // Get the render box of the widget above which the popup menu will be displayed
  final RenderBox button =
      widgetKey?.currentContext!.findRenderObject() as RenderBox;

  // Get the render box of the overlay (the whole screen)
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;

  // Calculate the position of the widget above which the popup menu will be displayed
  final position = RelativeRect.fromRect(
    Rect.fromPoints(
      button.localToGlobal(Offset.zero,
          ancestor: overlay), // Top-left point of the button
      button.localToGlobal(button.size.bottomRight(Offset.zero),
          ancestor: overlay), // Bottom-right point
    ),
    Offset.zero & overlay.size, // The overlay's size (whole screen)
  );

  // Show the popup menu above the widget
  final result = await showMenu<String>(
    constraints: BoxConstraints(
      minHeight: context.height * .2, // Minimum height of the popup menu
      minWidth: context.width * .5, // Minimum width of the popup menu
      maxHeight: context.height * .5, // Maximum height of the popup menu
      maxWidth: context.width * .5, // Maximum width of the popup menu
    ),
    clipBehavior:
        Clip.antiAliasWithSaveLayer, // Clip behavior of the popup menu
    context: context, // The context of the popup menu
    shape: RoundedRectangleBorder(
      // Shape of the popup menu
      borderRadius:
          BorderRadius.circular(25), // Border radius of the popup menu
    ),
    position: RelativeRect.fromLTRB(
      position.left, // Left position of the popup menu
      position.top -
          (button.size * 6)
              .height, // Move the menu above the button by subtracting the height
      position.right, // Right position of the popup menu
      position.bottom, // Bottom position of the popup menu
    ),
    items: [
      for (int i = 0; i < listOptions.length; i++)
        PopupMenuItem<String>(
          value: listOptions[i],
          child: Text(
            listOptions[i],
          ),
        ), // List of popup menu items
      if (listOptions.isEmpty)
        PopupMenuItem<String>(
          enabled: false,
          padding: const EdgeInsets.only(top: 50),
          value: 'no text',
          child: Text(
            'Empty List No Data Available',
            textAlign: TextAlign.center,
            style: context.textTheme.headlineMedium
                ?.copyWith(color: Colors.black54),
          ),
        )
    ],
    elevation: 2, // Elevation of the popup menu
  );

  // Handle menu item selection
  if (result != null) {
    animationController?.reverse(); // Reverse the animation controller
    txtController?.text =
        result; // Update the text controller with the selected option
  } else {
    animationController!
        .reverse(); // Reverse the animation controller if no option is selected
  }
}

///