
import 'package:fitpick/Pages/Home_page.dart';
import 'package:fitpick/Pages/preferences_layout.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url:"https://gsgwmatcgjxjprmthcmy.supabase.co" , anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdzZ3dtYXRjZ2p4anBybXRoY215Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg4ODg5ODEsImV4cCI6MjA2NDQ2NDk4MX0.s6Vt_2hhcsJctZIobAtsxaQK9_UqnSXzFsoHUThEiAg");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PreferencesLayout()
    );
  }
}


