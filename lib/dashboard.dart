import 'package:flutter/material.dart';
import 'hotlines.dart';
import 'countyhealth.dart';

void main() {
  runApp(MentalHealthApp());
}

class MentalHealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Health App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardScreen(),
      routes: {
        '/page1': (context) => DashboardScreen(),
        '/page2': (context) => HotlineScreen(),
        '/page3': (context) => CountyScreen(),
        '/page4': (context) => Placeholder(),

    );
  }
}
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Health Dashboard'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4.0,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'How are you feeling today?',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sentiment_dissatisfied),
                      SizedBox(width: 20),
                      Slider(
                        min: 0,
                        max: 100,
                        divisions: 5,
                        label: 'Feeling',
                        value: 50,
                        onChanged: (double value) {
                          // Implement functionality when the slider value changes
                        },
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.sentiment_satisfied),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4.0,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'To Do List',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  // TODO: Implement ToDo list widget
                  // You can use ListView.builder for dynamic list items
                ],
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4.0,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Recent Announcements',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  // TODO: Implement recent announcements widget
                  // You can use ListView.builder for dynamic announcements
                ],
              ),
            ),
          ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Page 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Page 4',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/page1');
              break;
            case 1:
              Navigator.pushNamed(context, '/page2');
              break;
            case 2:
              Navigator.pushNamed(context, '/page3');
              break;
            case 3:
              Navigator.pushNamed(context, '/page4');
              break;
          }
        },
      ),
    );
  }
}

