import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the Privacy Policy page content.'),
            SizedBox(height: 20),
            // Back to Home button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the HomeScreen
              },
              child: Text('Back to Homepage'),
            ),
          ],
        ),
      ),
    );
  }
}
