import 'package:flutter/material.dart';

class MentalHealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kids Mental Health Resources'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                //todo
              },
              child: Text('Mindfulness Exercises'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                //todo
              },
              child: Text('Breathing Exercises'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                //todo
              },
              child: Text('Understanding Emotions'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                //todo
              },
              child: Text('Art Therapy'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                //todo
              },
              child: Text('Stress Management'),
            ),
          ],
        ),
      ),
    );
  }
}
