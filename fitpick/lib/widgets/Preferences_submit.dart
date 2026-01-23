import 'package:fitpick/Pages/Shop.dart';
import 'package:flutter/material.dart';

class PreferencesSubmit extends StatelessWidget {
  const PreferencesSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Shop()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 38.0),
        child: Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              "Submit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}