import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Text(title),
          const SizedBox(height: 20),
          const Text('Settings Page'),
        ],
      ),
    );
  }
}
