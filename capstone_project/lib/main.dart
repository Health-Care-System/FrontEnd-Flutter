import 'package:capstone_project/screens/new_pass/new_pass.dart';
import 'package:capstone_project/screens/view_available_doctor/doctor_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Healthify',
        theme: ThemeData(
          fontFamily: 'FontRoboto',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const NewPassScreen());
  }
}
