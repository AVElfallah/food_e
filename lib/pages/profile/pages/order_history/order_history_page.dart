import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderHistoryPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OrderHistoryPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
