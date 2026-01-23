import 'package:fitpick/Pages/Login_home_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  // Sign up
  Future<String?> signup(String email, String password) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        if (response.session != null) {
          // Auto-login successful
          return null;
        } else {
          return "Sign up successful! Please confirm your email before logging in.";
        }
      }
      return "Unknown error occurred during sign up.";
    } on AuthException catch (e) {
      return e.message; // Supabase error message
    } catch (e) {
      return "Error: $e";
    }
  }

  // Login
  Future<String?> login(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        return null;  // Login successful
      }
      return "Invalid email or password.";
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Error: $e";
    }
  }

  // Logout
  Future<void> logout(BuildContext context) async {
    try {
      await supabase.auth.signOut();
      if (!context.mounted) return;  // Correct mounted check
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginHomePage()),
      );
    } catch (e) {
      print("Logout error: $e");
    }
  }
}
