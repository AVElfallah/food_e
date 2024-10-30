import 'package:flutter/material.dart';
import 'package:food_e/shared/constants/constant_padding.dart';

class CustomGridView extends StatelessWidget {
  final List<String> items; // List of items to display in the grid view

  const CustomGridView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pad8All,
      child: Column(
        children: _buildRows(), // Build rows of chips based on the items list
      ),
    );
  }

  List<Widget> _buildRows() {
    List<Widget> rows = []; // List to store the rows of chips
    int index = 0; // Index to keep track of the current item in the items list
    bool isThree = true; // Flag to determine the number of chips in each row

    while (index < items.length) {
      int count = isThree ? 3 : 2; // Number of chips in the current row
      if (index + count > items.length) {
        count =
            items.length - index; // Adjust count if there are fewer items left
      }

      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items
              .sublist(index, index + count)
              .map((item) => Expanded(
                    child: Padding(
                      padding: pad4All,
                      child: Chip(
                        label: Text(
                            item), // Create a chip for each item in the sublist
                      ),
                    ),
                  ))
              .toList(),
        ),
      );

      index += count; // Move to the next set of items
      isThree = !isThree; // Toggle the number of chips in the next row
    }

    return rows; // Return the list of rows
  }
}
