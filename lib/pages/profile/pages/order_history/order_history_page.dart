import 'package:flutter/material.dart'; // Importing Flutter's material design package
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/model/order_history_model.dart';

import '../../../../shared/widgets/role_model_appbar_widget.dart'; // Importing a custom app bar widget
import 'widgets/order_history_item_widget.dart'; // Importing a custom widget for order history items

// Defining a stateless widget named OrderHistoryPage
class OrderHistoryPage extends StatelessWidget {
  // Constructor for the widget, accepting a key
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return Scaffold(
      // Using a custom app bar widget
      appBar: RoleModelAppbarWidget(
        context,
        leadingIcon: Icons.arrow_back_ios_new, // Setting the leading icon
      ),
      // Adding padding around the body content
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10, // Vertical padding
          horizontal: 18, // Horizontal padding
        ),
        // Using a column to arrange widgets vertically
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligning children to the start
          children: [
            // Displaying the page title
            Text(
              'ORDER HISTORY',
              style: context.textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 30, // Adding space below the title
            ),
            // Expanding the ListView to take available space
            Expanded(
              child: ListView(
                children: [
                  // Adding order history items
                  OrderHistoryItemWidget(
                    // Order arrival status
                    model: OrderHistoryModel(
                      orderDate: DateTime(2024, 10, 2), // Order date

                      isArrived: true,
                      items: [
                        OrderHistoryMealItem(
                          mealName: 'Hamburger', // Item name
                          price: 30, // Item price
                          quantity: 1, // Item quantity
                        ),
                        OrderHistoryMealItem(
                          mealName: 'Meat', // Item name
                          price: 10, // Item price
                          quantity: 4, // Item quantity
                        ),
                        OrderHistoryMealItem(
                          mealName: 'Bread', // Item name
                          price: 12, // Item price
                          quantity: 6, // Item quantity
                        ),
                      ],
                    ),
                  ),
                  /* OrderHistoryItemWidget(
                    orderDate: DateTime(2024, 9, 22),
                    price: 160,
                    quantity: 5,
                    isArrived: true,
                  ),
                  OrderHistoryItemWidget(
                    orderDate: DateTime(2024, 6, 12),
                    price: 60,
                    quantity: 5,
                    isArrived: true,
                  ), */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
