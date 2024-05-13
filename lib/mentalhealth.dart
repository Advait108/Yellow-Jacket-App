import 'package:flutter/material.dart';

void main() {
  runApp(MentalHealthScreen());
}

class MentalHealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow, // Primary color set to yellow
        scaffoldBackgroundColor: Colors.yellow[100], // Lighter shade of yellow for the background
        textTheme: TextTheme(
          button: TextStyle(color: Colors.yellow[700]), // Custom text color for buttons
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Rounded corners for buttons
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mental Health Resources'),
          backgroundColor: Colors.black, // Black AppBar for contrast
          foregroundColor: Colors.yellow,
        ),
        body: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildActionButton(context, 'Journaling', Icons.book),
              SizedBox(height: 40.0),
              _buildActionButton(context, 'Tips and Exercises', Icons.fitness_center),
              SizedBox(height: 40.0),
              _buildActionButton(context, 'Habit Tracker', Icons.help_outline),
              SizedBox(height: 40.0),
              _buildActionButton(context, 'College Application Page', Icons.school),
              SizedBox(height: 40.0),
              _buildActionButton(context, 'Stress Management', Icons.mood),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String title, IconData icon) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.yellow[700]), // Icon color
      label: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      onPressed: () {
        // Todo: Implement button functionality
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.black54, // Button background color
        onPrimary: Colors.yellow[700], // Button text color
        padding: EdgeInsets.symmetric(vertical: 12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Rounded corners
        elevation: 5, // Shadow effect
      ),
    );
  }
}
