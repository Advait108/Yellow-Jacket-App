import 'package:flutter/material.dart';

class CountyScreen extends StatelessWidget {
  final List<Map<String, String>> hotlines = [
    {'name': 'Emergency Services', 'number': '911'},
    {'name': 'Suicide Prevention', 'number': '1-800-273-8255'},
    {'name': 'Substance Abuse Helpline', 'number': '1-800-662-4357'},
    // Add more hotline numbers and names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Hotlines'),
      ),
      body: ListView.builder(
        itemCount: hotlines.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(hotlines[index]['name'] ?? ''),
            subtitle: Text(hotlines[index]['number'] ?? ''),
            onTap: () {
              _callHotline(context, hotlines[index]['number'] ?? '');
            },
          );
        },
      ),
    );
  }

  void _callHotline(BuildContext context, String number) {
    // Implement the functionality to call the hotline number here
    // For example, you can use URL launcher to make the call
    // Make sure to import the package: url_launcher/url_launcher.dart
    // and handle platform-specific behavior for making phone calls
    // Here's an example using url_launcher:
    // launch('tel:$number');
    // Note: Make sure to add the necessary permissions in AndroidManifest.xml and Info.plist
    // to allow making phone calls.
    // Also handle exceptions and errors accordingly.
  }
}
