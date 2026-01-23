
import 'package:fitpick/Pages/Login_home_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => LoginHomePage()),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // button shape
        ),
        backgroundColor: Colors.black, // button background color
      ),
      child: const Text(
        "Login",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: Colors.white,
        ),
      ),
    );
  }
}
