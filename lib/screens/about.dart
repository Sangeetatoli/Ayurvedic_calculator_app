import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About the Ayurvedic Ratio Calculator App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'This application is designed to assist Ayurvedic practitioners and manufacturers in calculating ingredient ratios quickly and accurately for kwathadi and pathya kalpana preparations. The app simplifies the process of scaling formulations and ensures consistency in preparations.',
            ),
            SizedBox(height: 20),
            Text(
              'Key Features:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('- Ingredient ratio calculator.'),
            Text('- Batch size scaling.'),
            Text('- Intuitive user interface.'),
            Text('- Share and save results easily.'),
            SizedBox(height: 20),
            Text(
              'Developers:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('1. Akhilesh Malalikar'),
            Text('2. Soham Vhadadi'),
            Text('3. Sangeeta Toli'),
            Text('4. Ranjita Ambali'),
            SizedBox(height: 20),
            Text(
              'Guide:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Dr Rajshri Khanai'),
            SizedBox(height: 20),
            Text(
              'Acknowledgments:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('We would like to express our gratitude to our guide and mentors for their continuous support and guidance throughout the project.'),
            SizedBox(height: 20),
            // Back to Home button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the HomeScreen
                },
                child: Text('Back to Homepage'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
