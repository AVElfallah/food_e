import 'package:flutter/material.dart';

// This class defines a custom AppBar widget.
class RoleModelAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  // Private constructor for the class.
  const RoleModelAppbarWidget._({
    super.key,
    required this.preferredSize,
    this.centerTitle,
    this.title,
    this.leadingIcon,
  });

  // Variables to hold the properties of the AppBar.
  final bool? centerTitle; // Whether the title is centered.
  final Widget? title; // The title widget.
  final IconData? leadingIcon; // The icon for the leading button.

  // Factory constructor to create an instance of the class.
  factory RoleModelAppbarWidget(
    BuildContext context, {
    Key? key,
    bool? centerTitle,
    Widget? title,
    double? heightFromScreen,
    IconData? leadingIcon,
  }) {
    // Determine the height of the app bar. If heightFromScreen is provided, use it;
    // otherwise, use the full screen height.
    double height = heightFromScreen ?? MediaQuery.of(context).size.height;

    // Return an instance of RoleModelAppbarWidget using the private constructor.
    return RoleModelAppbarWidget._(
      // Set the preferred size of the app bar to 10% of the determined height.
      preferredSize: Size.fromHeight(
        height * .1,
      ),
      // Pass the key parameter if provided.
      key: key,
      // Center the title by default unless specified otherwise.
      centerTitle: centerTitle ?? true,
      // Use the provided title widget or an empty widget if none is provided.
      title: title ?? const SizedBox.shrink(),
      // Use the provided leading icon or a default close icon if none is provided.
      leadingIcon: leadingIcon ?? Icons.close,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Check if the current route can be popped (i.e., if there is a previous route).
    final canPop = !Navigator.of(context).canPop();
    return AppBar(
      centerTitle: centerTitle,
      title: title,
      // If the route can be popped, show the leading icon button; otherwise, show nothing.
      leading: canPop
          ? IconButton(
              icon: Icon(leadingIcon),
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {
                // Pop the current route when the button is pressed.
                Navigator.of(context).pop();
              },
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  final Size preferredSize; // The preferred size of the AppBar.
}
