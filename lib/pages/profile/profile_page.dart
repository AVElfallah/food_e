import 'package:flutter/material.dart';

import '../../shared/layouts/shared_bottom_nav_layout.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfilePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: const SharedBottomNavLayout(currentIndex: 4),
    );
  }
}
