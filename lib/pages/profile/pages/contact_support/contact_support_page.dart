import 'package:flutter/material.dart';

class ContactSupportPage extends StatelessWidget {
  const ContactSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactSupportPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ContactSupportPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
