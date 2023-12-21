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
                // Navigate to a page or website about mindfulness exercises for kids
              },
              child: Text('Mindfulness Exercises'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to a page or website with breathing exercises for kids
              },
              child: Text('Breathing Exercises'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to a page or website explaining emotions and how to manage them
              },
              child: Text('Understanding Emotions'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to a page or website providing art therapy resources for kids
              },
              child: Text('Art Therapy'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to a page or website with resources for dealing with stress
              },
              child: Text('Stress Management'),
            ),
            // Add more buttons or resources as needed
          ],
        ),
      ),
    );
  }
}
