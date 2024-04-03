import 'package:flutter/material.dart';

class MentalHealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow, // Set primary color to yellow
        scaffoldBackgroundColor: Colors.yellow[100],
        // Set scaffold background color to a lighter shade of yellow
        // You can customize more theme properties as per your requirement
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mental Health Resources'),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button background color
                  foregroundColor: Colors.yellow[700], // Button text color
                ),
                child: Text(
                  'Journaling',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  //todo
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button background color
                  foregroundColor: Colors.yellow[700], // Button text color
                ),
                child: Text(
                  'Exercises',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  //todo
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button background color
                  foregroundColor: Colors.yellow[700], // Button text color
                ),
                child: Text(
                  '...',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  //todo
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button background color
                  foregroundColor: Colors.yellow[700], // Button text color
                ),
                child: Text(
                  'idk',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  //todo
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button background color
                  foregroundColor: Colors.yellow[700], // Button text color
                ),
                child: Text(
                  'Stress Management',
                  style: TextStyle(fontSize: 16),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MentalHealthScreen());
}
