import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MentalHealthScreen());
}

class MentalHealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow,
        scaffoldBackgroundColor: Colors.yellow[100],
        textTheme: TextTheme(
          button: TextStyle(color: Colors.yellow[700]),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mental Health Resources'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.yellow,
        ),
        body: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildActionButton(context, 'Journaling', Icons.book),
              SizedBox(height: 40.0),
              _buildActionButton(context, 'Tips and Exercises', Icons.fitness_center),
              SizedBox(height: 40.0),
              _buildActionButton(context, 'Habit Tracker', Icons.check_circle_outline),
              SizedBox(height: 40.0),
              _buildActionButton(context, 'Stress Management', Icons.mood),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String title, IconData icon) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.yellow[700]),
      label: Text(title, style: TextStyle(fontSize: 16)),
      onPressed: () => _showPopup(context, title),
      style: ElevatedButton.styleFrom(
        primary: Colors.black54,
        onPrimary: Colors.yellow[700],
        padding: EdgeInsets.symmetric(vertical: 12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
      ),
    );
  }

  void _showPopup(BuildContext context, String featureName) {
    Widget content = _popupContent(context, featureName);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.all(10.0),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(featureName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: content,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Close'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow[700],
                      onPrimary: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  Widget _popupContent(BuildContext context, String featureName) {
    switch (featureName) {
      case 'Journaling':
        return JournalingWidget();
      case 'Tips and Exercises':
        return TipsAndExercisesWidget();
      case 'Habit Tracker':
        return HabitTrackerWidget();
      case 'Stress Management':
        return StressManagementWidget();
      default:
        return Text("No information available.");
    }
  }
}

class JournalingWidget extends StatefulWidget {
  @override
  _JournalingWidgetState createState() => _JournalingWidgetState();
}

class _JournalingWidgetState extends State<JournalingWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _entryController = TextEditingController();
  List<Map<String, String>> entries = [
    {"title": "Gratitude", "text": "Today I felt grateful for the sunny weather."},
    {"title": "Challenge", "text": "Faced a tough situation at work but I managed well."},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _titleController,
          decoration: InputDecoration(hintText: 'Entry Title'),
        ),
        TextField(
          controller: _entryController,
          decoration: InputDecoration(hintText: 'Enter your journal entry'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty && _entryController.text.isNotEmpty) {
              setState(() {
                entries.add({
                  "title": _titleController.text,
                  "text": _entryController.text
                });
                _titleController.clear();
                _entryController.clear();
              });
            }
          },
          child: Text('Add Entry'),
        ),
        SizedBox(
          height: 200, // Fixed height to avoid overflow
          child: ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(entries[index]["title"]!),
                subtitle: Text(entries[index]["text"]!),
                onTap: () => _editEntry(context, index),
              );
            },
          ),
        ),
      ],
    );
  }

  void _editEntry(BuildContext context, int index) {
    _titleController.text = entries[index]["title"]!;
    _entryController.text = entries[index]["text"]!;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Edit Entry'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(hintText: 'Entry Title'),
                ),
                TextField(
                  controller: _entryController,
                  decoration: InputDecoration(hintText: 'Enter your journal entry'),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  setState(() {
                    entries[index] = {
                      "title": _titleController.text,
                      "text": _entryController.text
                    };
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}

class TipsAndExercisesWidget extends StatefulWidget {
  @override
  _TipsAndExercisesWidgetState createState() => _TipsAndExercisesWidgetState();
}

class _TipsAndExercisesWidgetState extends State<TipsAndExercisesWidget> {
  List<Map<String, dynamic>> tips = [
    {"tip": "Breathe in for 4 seconds, hold for 7 seconds, and exhale for 8 seconds.", "isFavorite": false},
    {"tip": "Visualize a calm and peaceful scenery.", "isFavorite": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...tips.map((tip) {
          return ListTile(
            title: Text(tip["tip"]),
            trailing: IconButton(
              icon: Icon(tip["isFavorite"] ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                setState(() {
                  tip["isFavorite"] = !tip["isFavorite"];
                });
              },
            ),
          );
        }).toList(),
        ElevatedButton(
          onPressed: _addTip,
          child: Text('Add Tip'),
        ),
      ],
    );
  }

  void _addTip() {
    TextEditingController tipController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('New Exercise Tip'),
            content: TextField(
              controller: tipController,
              decoration: InputDecoration(hintText: 'Enter a new tip'),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Add'),
                onPressed: () {
                  if (tipController.text.isNotEmpty) {
                    setState(() {
                      tips.add({"tip": tipController.text, "isFavorite": false});
                      Navigator.pop(context);
                    });
                  }
                },
              ),
              ElevatedButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }
}

class HabitTrackerWidget extends StatefulWidget {
  @override
  _HabitTrackerWidgetState createState() => _HabitTrackerWidgetState();
}

class _HabitTrackerWidgetState extends State<HabitTrackerWidget> {
  final TextEditingController _habitController = TextEditingController();
  List<Map<String, dynamic>> habits = [
    {"habit": "Morning Yoga", "completedToday": false, "streak": 4},
    {"habit": "Read 30 minutes", "completedToday": true, "streak": 7},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _habitController,
          decoration: InputDecoration(hintText: 'Enter a habit to track'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_habitController.text.isNotEmpty) {
              setState(() {
                habits.add({"habit": _habitController.text, "completedToday": false, "streak": 0});
                _habitController.clear();
              });
            }
          },
          child: Text('Add Habit'),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: habits.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(habits[index]["habit"]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(habits[index]["completedToday"] ? Icons.check_circle : Icons.check_circle_outline),
                      onPressed: () {
                        setState(() {
                          habits[index]["completedToday"] = !habits[index]["completedToday"];
                          if (habits[index]["completedToday"]) {
                            habits[index]["streak"]++;
                          } else {
                            habits[index]["streak"] = max(0, (habits[index]["streak"] as int) - 1);
                          }
                        });
                      },
                    ),
                    Text("🔥 ${habits[index]["streak"]}"),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class StressManagementWidget extends StatelessWidget {
  final _urls = {
    "Mental Health Association of Alameda County": "http://www.mhaac.org",
    "Alameda County Behavioral Health": "http://www.acbhcs.org",
  };
  final List<String> resources = [
    "5-minute meditation audio",
    "Guided relaxation video",
    "Deep breathing exercise instructions",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._urls.keys.map((title) {
          return ListTile(
            title: Text(title),
            onTap: () => _launchURL(_urls[title]),
          );
        }).toList(),
        Divider(),
        ...resources.map((resource) {
          return ListTile(
            title: Text(resource),
            leading: Icon(Icons.headset),
            onTap: () {
              // Placeholder for resource action
            },
          );
        }).toList(),
      ],
    );
  }

  void _launchURL(String? url) async {
    if (url != null && await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
