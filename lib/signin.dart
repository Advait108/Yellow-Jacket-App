import 'package:flutter/material.dart';
import 'dashboard.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _signIn() {
    // Implement your sign-in logic here
    String email = _emailController.text;
    String password = _passwordController.text;

    // For example, print the values for demonstration purposes
    print('Email: $email');
    print('Password: $password');

    // Navigate to DashboardScreen directly when the sign-in function is called
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );

    // Implement your sign-in authentication or API call here
    // This is where you might call an API to authenticate the user
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Colors.yellow[700], // Yellow color for app bar
      ),
      backgroundColor: Colors.yellow[100], // Light yellow background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white, // White text field background
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white, // White text field background
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signIn,
              child: const Text('Sign In'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Black button color
                onPrimary: Colors.yellow[700], // Yellow text color
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
