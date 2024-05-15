import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = "https://www.bifyellowpages.org/";

class SchoolResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow,
        scaffoldBackgroundColor: Colors.yellow[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.yellow,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.yellow[700],
            primary: Colors.black54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('School Resources'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          color: Colors.yellow[100],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElevatedButton(context, 'Newspaper', Icons.newspaper, _launchURL),
                SizedBox(height: 40.0),
                _buildElevatedButton(context, 'Event Calendar', Icons.calendar_today, () => _showPopup(context, 'Event Calendar')),
                SizedBox(height: 40.0),
                _buildElevatedButton(context, 'Office Hours [BROKEN]', Icons.access_time, () => _showPopup(context, 'Office Hours')),
                SizedBox(height: 40.0),
                _buildElevatedButton(context, 'College Applications', Icons.school, () => _showPopup(context, 'College Applications')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 24.0),
      label: Text(title, style: TextStyle(fontSize: 20.0)),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 60)),
    );
  }

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  void _showPopup(BuildContext context, String featureName) {
    Widget content = _popupContent(context, featureName);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.all(10.0),
            child: Container(
              height: 450,
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
      case 'Event Calendar':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("May Calendar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Table(
              border: TableBorder.all(color: Colors.black),
              children: List.generate(4, (index) => TableRow(
                children: List.generate(7, (i) {
                  int date = index * 7 + i + 1;
                  if (date <= 28) {
                    return GestureDetector(
                      onTap: () => _showDateDetails(context, date),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8),
                        color: ((index * 7 + i) % 7 == 0 || (index * 7 + i) % 7 == 6) ? Colors.grey[300] : Colors.white,
                        child: Text("$date", style: TextStyle(fontSize: 16)),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
              )),
            ),
          ],
        );
      case 'Office Hours':
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search for a teacher",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Implement search functionality here
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Teacher')),
                    DataColumn(label: Text('Day')),
                    DataColumn(label: Text('Hours')),
                  ],
                  rows: List<DataRow>.generate(45, (index) {
                    String name = 'Teacher #$index';
                    if (index == 0) name = 'Dr. Sanhita';
                    if (index == 1) name = 'Ms. Sagal';
                    if (index == 2) name = 'Mr. Hanlon';
                    return DataRow(cells: [
                      DataCell(Text(name)),
                      DataCell(Text(['Mon, Wed', 'Tue, Thu', 'Fri'][index % 3])),
                      DataCell(Text(['10 AM - 12 PM', '1 PM - 3 PM', '9 AM - 11 AM'][index % 3])),
                    ]);
                  }),
                ),
              ),
            ),
          ],
        );
      case 'College Applications':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("College Application Resources:"),
            TextButton(
              onPressed: () {}, // Dummy function for illustration
              child: Text('Application Tips'),
            ),
            TextButton(
              onPressed: () {}, // Dummy function for illustration
              child: Text('Example Essays'),
            ),
            TextButton(
              onPressed: () {}, // Dummy function for illustration
              child: Text('Extracurricular Opportunities'),
            ),
          ],
        );
      default:
        return Text("Details about $featureName will go here. Implement the respective functionality.");
    }
  }

  void _showDateDetails(BuildContext context, int date) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Events on May $date"),
          content: Text("Details of events go here. Sport games, half days, etc.."),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}