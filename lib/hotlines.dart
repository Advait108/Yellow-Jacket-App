import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlineScreen extends StatelessWidget {
  final List<Map<String, String>> hotlines = [
    {'name': 'Emergency Services', 'number': '911'},
    {'name': 'Suicide Prevention', 'number': '1-800-273-8255'},
    {'name': 'Substance Abuse Helpline', 'number': '1-800-662-4357'},
    {'name': 'National Domestic Violence Hotline', 'number': '1-800-799-7233'},
    {'name': 'Crisis Text Line', 'number': 'Text HOME to 741741'},
    {'name': 'National Eating Disorders Association', 'number': '1-800-931-2237'},
    {'name': 'National Sexual Assault Hotline', 'number': '1-800-656-4673'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow, // Set primary color to a vibrant yellow
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.yellow,
        ).copyWith(
          secondary: Colors.black, // Set secondary color to black
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // Set app bar background color to black
          titleTextStyle: TextStyle(color: Colors.yellow, fontSize: 19, fontWeight: FontWeight.bold), // Enhanced style for app bar title
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Emergency Hotlines'),
          backgroundColor: Colors.black, // Ensure app bar background is black
          foregroundColor: Colors.yellow, // Ensure app bar text is yellow
        ),
        body: ListView.builder(
          itemCount: hotlines.length,
          itemBuilder: (context, index) {
            bool isTextLine = hotlines[index]['name'] == 'Crisis Text Line';
            return ListTile(
              title: Text(
                hotlines[index]['name'] ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[800], // Set text color to yellow
                ),
              ),
              subtitle: Text(
                hotlines[index]['number'] ?? '',
                style: TextStyle(
                  color: Colors.black, // Set text color to black
                ),
              ),
              trailing: IconButton(
                icon: Icon(isTextLine ? Icons.message : Icons.phone), // Conditional icon
                color: Colors.black, // Set icon color to black
                onPressed: () {
                  _showConfirmationDialog(context, hotlines[index]['number'] ?? '', isTextLine);
                },
              ),
              onTap: () {
                _showConfirmationDialog(context, hotlines[index]['number'] ?? '', isTextLine);
              },
            );
          },
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, String number, bool isTextLine) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isTextLine ? "Confirm Text" : "Confirm Call"),
          content: Text("${isTextLine ? '' : 'Call'} $number?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                primary: Colors.white, // Text color
                backgroundColor: Colors.pink[300], // Light pastel red for Cancel
              ),
            ),
            TextButton(
              child: Text(isTextLine ? "Text" : "Call"),
              onPressed: () {
                Navigator.of(context). pop();
                ScaffoldMessenger.of(context). showSnackBar(
                  SnackBar(
                    content: Text('${isTextLine ? "Texting" : "Calling"} feature not enabled yet.'),
                  ),
                );
              },
              style: TextButton.styleFrom(
                primary: Colors.white, // Text color
                backgroundColor: Colors.lightGreen[400], // Light pastel green for Call
              ),
            ),
          ],
        );
      },
    );
  }
}
