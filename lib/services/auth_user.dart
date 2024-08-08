import 'package:flutter_app/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthServices {
  Future<void> signUp(String email, String password, String username,
      String strand, String school) async {
    try {
      final http.Response res = await http.post(
        Uri.parse('${Constants.uri}/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'username': username,
          'school': school,
          'strand': strand,
        }),
      );

      if (res.statusCode == 200) {
        print('Registration successful');
      } else {
        print('Failed to register: ${res.body}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      final http.Response res = await http.post(
        Uri.parse('${Constants.uri}/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (res.statusCode == 200) {
        print('Login successful');
      } else {
        print('Failed to login: ${res.body}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
