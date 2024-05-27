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
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: const Text('Settings'),
              content: const Text('Coming soon...'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.maybePop(context),
                  child: const Text('Close'),
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            );
          });

        },
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      )
    );
  }
}
