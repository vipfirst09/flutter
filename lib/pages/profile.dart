library profile;

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/about.dart';
import 'package:flutter_application_1/pages/home.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Center(child: const Text("Profile Page")),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const HomePage(), // Navigate to HomePage
                  ),
                );
              },
              child: const Text("Back to Home Page"),
            ),
            const SizedBox(height: 20), // Add space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const AboutPage(), // Navigate to ProfilePage
                  ),
                );
              },
              child: const Text("Go to About Page"),
            ),
          ],
        ),
      ),
    );
  }
}
