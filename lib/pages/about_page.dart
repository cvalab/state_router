import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key, required this.title});

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
          const Text('About Page')
        ],
      ),
    );
  }
}
