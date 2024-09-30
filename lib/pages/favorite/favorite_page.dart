import 'package:flutter/material.dart';

import '../../shared/layouts/shared_bottom_nav_layout.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoritePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FavoritePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: const SharedBottomNavLayout(currentIndex: 3),
    );
  }
}
