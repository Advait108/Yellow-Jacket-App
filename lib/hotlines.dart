import 'package:flutter/material.dart';

class HotlineScreen extends StatelessWidget {
  final List<Map<String, String>> hotlines = [
    {'name': 'Emergency Services', 'number': '911'},
    {'name': 'Suicide Prevention', 'number': '1-800-273-8255'},
    {'name': 'Substance Abuse Helpline', 'number': '1-800-662-4357'},
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
   //todo
  }
}
