import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Ensure you have url_launcher in your pubspec.yaml

const _url = "https://www.bifyellowpages.org/";

class SchoolResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow, // Set primary color to yellow
        scaffoldBackgroundColor: Colors.yellow[100], // Lighter shade of yellow for background
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // AppBar background color
          foregroundColor: Colors.yellow, // AppBar text color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.yellow[700], // Button text color
            primary: Colors.black54, // Button background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
            ),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          ),
        ),
        textTheme: TextTheme(
          button: TextStyle(
            color: Colors.yellow[700], // Button text color
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('School Resources'),
        ),
        body: Container(
          color: Colors.yellow[100], // Changed to a solid color background
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElevatedButton(context, 'Newspaper', _launchURL),
                SizedBox(height: 20.0),
                _buildElevatedButton(context, 'Event Calendar', () {
                  // TODO: Implement Event Calendar navigation or functionality
                }),
                SizedBox(height: 20.0),
                _buildElevatedButton(context, 'Office Hours', () {
                  // TODO: Implement Office Hours navigation or functionality
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context, String title, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  // Function to launch the newspaper website
  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
