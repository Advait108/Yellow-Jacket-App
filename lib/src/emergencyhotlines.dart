import 'package:flutter/material.dart';

void main() {
  runApp(EmergencyHotlinesApp());
}

class EmergencyHotlinesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency Hotlines',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EmergencyHotlinesPage(),
    );
  }
}

class EmergencyHotlinesPage extends StatelessWidget {
  void _callEmergency(String service) {
    // Implement logic to call the respective emergency service based on the button pressed

    print('Calling $service');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Hotlines'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _callEmergency('Police'),
              child: Text('Police', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 100),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _callEmergency('Ambulance'),
              child: Text('Ambulance', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 100),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _callEmergency('Fire'),
              child: Text('Fire', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 100),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _callEmergency('Emergency Contact'),
              child: Text('Emergency Contact', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
