import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How to Use the Ayurvedic Ratio Calculator App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Step 1: Click on Lets Calculate! Button',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Which will redirect you to the formulation calculation page',
            ),
            SizedBox(height: 10),
            Text(
              'Step 2: Select the class of formulation',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Select any formulation class from the dropdown Eg:-Arka,Guggulu etc',
            ),
            SizedBox(height: 10),
            Text(
              'Step 3:Select the formulation ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Select any formulation from the dropdown Eg:-Kancanara Guggulu(Guggulu),Ajamodadi Curna(Curna) etc',
            ),
            SizedBox(height: 10),
            Text(
              'Step 4: Enter the desired total quantity of the formulation to be calculated',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Enter any quantity like Eg:- 100,50 etc',
            ),
            SizedBox(height: 10),
            Text(
              'Step 5: Select the unit in which the result should be calculated',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Select grams(gm) or kilograms(kg)',
            ),
            SizedBox(height: 20),
            Text(
              'Step 6: Press on Calculate button',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Calculates and displays the  results after pressing calculate button ',
            ),
            SizedBox(height: 20),
            Text(
              'Step 7:Press on Download results as TXT to save results',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'This will save the calculated results in .txt format on your phone locally',
            ),
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
