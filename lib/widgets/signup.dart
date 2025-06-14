import 'package:fitpick/Pages/Home_page.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // button shape
        ),
        backgroundColor: Colors.black, // button background color
      ),
      child: const Text(
        "Sign up",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: Colors.white,
        ),
      ),
    );
  }
}
