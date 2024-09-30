import 'package:flutter/material.dart';
import 'package:food_e/shared/layouts/shared_bottom_nav_layout.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BasketPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: const SharedBottomNavLayout(currentIndex: 2),
    );
  }
}
