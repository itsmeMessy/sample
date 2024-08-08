import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/3rdpage.dart';
import 'package:flutter_app/pages/homepage.dart';
import 'package:flutter_app/services/auth_user.dart';

void main() {
  runApp(const LoginAccount());
}

class LoginAccount extends StatelessWidget {
  const LoginAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite,
              color: Colors.black,
              size: 100,
            ),
            Text(
              'e P r e d i k',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 100),
            LoginandPassword(),
          ],
        ),
      ),
    );
  }
}

class LoginandPassword extends StatefulWidget {
  const LoginandPassword({super.key});

  @override
  _LoginandPasswordState createState() => _LoginandPasswordState();
}

class _LoginandPasswordState extends State<LoginandPassword> {
  String email = '';
  String password = '';

  void signin() {
    AuthServices().signIn(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Email Address',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.grey[1000],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Password',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.grey[1000],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forget Your Password?',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            MyButton(onPressed: signin),
            const Mybutton1(),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  const MyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      child: CupertinoButton(
        color: CupertinoColors.black,
        onPressed: onPressed,
        child: const Text(
          'Login',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
    );
  }
}

class Mybutton1 extends StatelessWidget {
  const Mybutton1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      child: CupertinoButton(
        color: CupertinoColors.white,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignUpForms()));
        },
        child: const Text(
          'SignUp',
          style: TextStyle(color: CupertinoColors.black),
        ),
      ),
    );
  }
}
