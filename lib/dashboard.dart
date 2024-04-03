import 'package:flutter/material.dart';
import 'hotlines.dart';
import 'countyhealth.dart';
import 'schoolresources.dart';
import 'mentalhealth.dart';

void main() {
  runApp(MentalHealthApp());
}

class MentalHealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Health App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.yellow[100],
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    MentalHealthScreen(),
    CountyScreen(),
    SchoolResourcesPage(),
    HotlineScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow[700],
      ),
      body: Container(
        color: Colors.white,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Health'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Undecided'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'BASIS'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Hotlines'),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController _todoController = TextEditingController();
  List<String> _todos = [];
  String _announcement = "No new announcements";
  double _sliderValue = 50;

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todos.add(task);
        _todoController.clear();
      });
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Speak with an Adult"),
          content: Text("Would you like to speak with an adult at school?"),
          actions: <Widget>[
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 4.0,
              color: Colors.yellow[700],
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text('How are you feeling today?', style: TextStyle(fontSize: 18.0, color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sentiment_dissatisfied, color: Colors.white),
                        SizedBox(width: 20),
                        Expanded(
                          child: Slider(
                            min: 0,
                            max: 100,
                            divisions: 5,
                            label: '${_sliderValue.round()}',
                            value: _sliderValue,
                            onChanged: (double value) {
                              setState(() {
                                _sliderValue = value;
                              });
                            },
                            onChangeEnd: (double value) {
                              if (value < 50) {
                                _showDialog();
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 20),
                        Icon(Icons.sentiment_satisfied, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 4.0,
              color: Colors.yellow[700],
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        labelText: 'Add a task',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.add, color: Colors.white),
                          onPressed: () => _addTodoItem(_todoController.text),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ..._todos.map((todo) => ListTile(title: Text(todo, style: TextStyle(color: Colors.white)))).toList(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 4.0,
              color: Colors.yellow[700],
              child: ListTile(
                title: Text('Recent Announcements', style: TextStyle(fontSize: 18.0, color: Colors.white)),
                subtitle: Text(_announcement, style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
