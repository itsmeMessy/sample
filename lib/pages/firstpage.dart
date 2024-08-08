
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/3rdpage.dart';
import 'package:flutter_app/pages/secondpage.dart';


void main() {
  runApp(const LoginandSignUp());
}

class LoginandSignUp extends StatelessWidget {
  const LoginandSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.favorite, size: 150, color: Colors.black,),
          const SizedBox(height: 50,),
          Container(
            child: (const ButtonLogin()),
        
          ),

          Container(
            child: (const ButtonSignUp()),
          ),

        ],
      ),
    );
  }
}



class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0, // Set width here
      child: CupertinoButton(
        color: CupertinoColors.black,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginAccount()));
        },
        child: const Text(
          'Login',
          style: TextStyle(color: CupertinoColors.white),
        
        ),
      ),
    );
  }
}


class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0, // Set width here
      child: CupertinoButton(
        color: CupertinoColors.white, // White background color
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpForms()));
        },
        child: const Text(
          'SignUp', // Or any text you prefer
          style: TextStyle(color: CupertinoColors.black), // Black text color
        ),
      ),
    );
  }
}
