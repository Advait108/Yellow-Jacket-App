import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<String?> signIn(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/login'), // Use your actual backend server URL
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['token'];
    } else {
      return null;
    }
  }
}
