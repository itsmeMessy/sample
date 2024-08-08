import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/firstpage.dart';
import 'package:flutter_app/pages/homepage.dart';
import 'package:flutter_app/services/auth_user.dart';

void main() {
  runApp(const SignUpForms());
}

class SignUpForms extends StatelessWidget {
  const SignUpForms({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.app_registration_outlined,
                  color: Colors.black, size: 100),
              SizedBox(height: 20),
              Text(
                'Sign Up Forms',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              RegisterForms(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForms extends StatefulWidget {
  const RegisterForms({super.key});

  @override
  _RegisterFormsState createState() => _RegisterFormsState();
}

class _RegisterFormsState extends State<RegisterForms> {
  String username = '';
  String email = '';
  String strand = '';
  String school = '';
  String password = '';
  String confirmPassword = '';

  void _signup() {
    if (password != confirmPassword) {
      print("Password didn't match!");
    } else {
      AuthServices().signUp(email, password, username, strand, school);
      print('Registerd');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildTextField(
              label: 'Username',
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            _buildTextField(
              label: 'Email',
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            _buildTextField(
              label: 'Strand',
              onChanged: (value) {
                setState(() {
                  strand = value;
                });
              },
            ),
            _buildTextField(
              label: 'School',
              onChanged: (value) {
                setState(() {
                  school = value;
                });
              },
            ),
            _buildTextField(
              label: 'Password',
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            _buildTextField(
              label: 'Confirm Password',
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  confirmPassword = value;
                });
              },
            ),
            const SizedBox(height: 20),
            MyButton(onPressed: _signup),
            const SizedBox(height: 10),
            MyButton1(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 10),
        TextField(
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            labelText: label,
            labelStyle: TextStyle(
                color: Colors.grey[1000],
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MyButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      child: CupertinoButton(
        color: CupertinoColors.black,
        onPressed: onPressed,
        child: const Text(
          'Register',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
    );
  }
}

class MyButton1 extends StatelessWidget {
  const MyButton1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      child: CupertinoButton(
        color: CupertinoColors.white,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginandSignUp()));
        },
        child: const Text(
          'Cancel',
          style: TextStyle(color: CupertinoColors.black),
        ),
      ),
    );
  }
}
