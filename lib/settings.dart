import 'package:flutter/material.dart';
import 'signin.dart'; // Import the SignInPage

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkTheme = false;
  bool _notificationsEnabled = true;
  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text('Personal Information', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Update your personal information'),
                  leading: Icon(Icons.person, color: Colors.yellow[700]),
                  onTap: () {
                    // Navigate to personal information edit page
                  },
                ),
                color: Colors.yellow[100],
              ),
            ),
            Divider(),
            SwitchListTile(
              title: Text('Dark Theme'),
              value: _darkTheme,
              onChanged: (bool value) {
                setState(() {
                  _darkTheme = value;
                });
              },
              secondary: Icon(Icons.dark_mode, color: Colors.yellow[700]),
            ),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              secondary: Icon(Icons.notifications_active, color: Colors.yellow[700]),
            ),
            ListTile(
              title: Text('Font Size'),
              trailing: DropdownButton<double>(
                value: _fontSize,
                onChanged: (double? newValue) {
                  setState(() {
                    if (newValue != null) {
                      _fontSize = newValue;
                    }
                  });
                },
                items: <double>[12.0, 14.0, 16.0, 18.0].map<DropdownMenuItem<double>>((double value) {
                  return DropdownMenuItem<double>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
              leading: Icon(Icons.text_fields, color: Colors.yellow[700]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.yellow[100],
                child: ListTile(
                  title: Text('Account Security', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Settings related to account security'),
                  leading: Icon(Icons.security, color: Colors.yellow[700]),
                  onTap: () {
                    // Navigate to security settings page
                  },
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.info_outline, color: Colors.yellow[700]),
              onTap: () {
                // Show about dialog
                showAboutDialog(
                  context: context,
                  applicationIcon: FlutterLogo(),
                  applicationName: 'The Hive Settings',
                  applicationVersion: '1.0.0',
                  children: <Widget>[
                    Text("Thank you for using our application!"),
                  ],
                );
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              onTap: () {
                _showSignOutConfirmation();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSignOutConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Out'),
          content: Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.pink[300],
                foregroundColor: Colors.white, // Set text color to white
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Sign Out'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightGreen[400],
                foregroundColor: Colors.white, // Set text color to white
              ),
              onPressed: () {
                Navigator.of(context). pop(); // Close the dialog first
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()), // Navigate to the sign-in page
                );
              },
            ),
          ],
        );
      },
    );
  }
}
