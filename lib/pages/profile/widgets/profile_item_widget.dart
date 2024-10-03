import 'package:flutter/material.dart'; // Importing Flutter's material design package
import 'package:food_e/extensions/context_extension.dart';

import '../../../helpers/colors_helper.dart'; // Importing a custom helper for colors

// Defining a stateless widget named ProfileItemWidget
class ProfileItemWidget extends StatelessWidget {
  // Constructor for the widget, accepting key, icon, title, and an optional onTap callback
  const ProfileItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  // Declaring final fields for the widget's properties
  final IconData icon; // Icon to be displayed in the list tile
  final String title; // Title text to be displayed in the list tile
  final void Function()? onTap; // Optional callback function for tap events

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return ListTile(
      leading: Icon(
        icon, // Setting the icon
        color: ColorsHelper.primary, // Using a custom color from ColorsHelper
      ),
      title: Text(
        title, // Setting the title text
        style: context.textTheme.bodyMedium, // Styling the text
      ),
      trailing: const Icon(Icons.arrow_forward_ios,
          color: Colors.white), // Adding a trailing arrow icon
      onTap: () {
        // Defining the action to be taken when the tile is tapped
        onTap?.call(); // Calling the onTap callback if it's provided
      },
    );
  }
}
