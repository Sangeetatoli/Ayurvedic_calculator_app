import 'package:flutter/material.dart';
import 'formulation_page.dart'; // Import the formulation page
import 'about.dart'; // Import about.dart
import 'privacy.dart'; // Import privacy.dart
import 'help.dart'; // Import help.dart

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayurvedic Ratio Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Logo
            Image.asset(
              'assets/th.jpg', // Update with the actual logo path
              height: 150, // Adjust as needed
            ),

            SizedBox(height: 20), // Space between logo and description

            // App Description
            Text(
              'Welcome to the app,\nCalculate ingredient ratios for Ayurvedic formulations based on your desired quantity.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 40), // Space before the button

            // Let's Calculate button
            ElevatedButton(
              onPressed: () {
                // Navigate to the FormulationPage when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormulationPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Updated to backgroundColor
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              child: Text(
                'Let\'s Calculate',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white, // Text color
                ),
              ),
            ),

            SizedBox(height: 40), // Space between calculate button and footer options

            // Footer section for About, Privacy Policy, and Help options in horizontal row
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the row content
              children: [
                // About button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()), // Navigate to AboutPage
                    );
                  },
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                
                // Separator
                Text(
                  '|',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // Privacy Policy button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrivacyPage()), // Navigate to PrivacyPage
                    );
                  },
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // Separator
                Text(
                  '|',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // Help button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpPage()), // Navigate to HelpPage
                    );
                  },
                  child: Text(
                    'Help',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
