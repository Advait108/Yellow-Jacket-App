import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlineScreen extends StatelessWidget {
  final List<Map<String, String>> hotlines = [
    {'name': 'Emergency Services', 'number': '911'},
    {'name': 'Suicide Prevention', 'number': '1-800-273-8255'},
    {'name': 'Substance Abuse Helpline', 'number': '1-800-662-4357'},
    {'name': 'National Domestic Violence Hotline', 'number': '1-800-799-7233'},
    {'name': 'Crisis Text Line', 'number': 'Text HOME to 741741'},
    {'name': 'Veterans Crisis Line', 'number': '1-800-273-8255, Press 1'},
    {'name': 'National Sexual Assault Hotline', 'number': '1-800-656-4673'},
    {'name': 'National Eating Disorders Association', 'number': '1-800-931-2237'},
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
            title: Text(
              hotlines[index]['name'] ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(hotlines[index]['number'] ?? ''),
            trailing: IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
                _callHotline(context, hotlines[index]['number'] ?? '');
              },
            ),
            onTap: () {
              _callHotline(context, hotlines[index]['number'] ?? '');
            },
          );
        },
      ),
    );
  }

  void _callHotline(BuildContext context, String number) async {
    final url = 'tel:$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Could not call $number'),
      ));
    }
  }
}
