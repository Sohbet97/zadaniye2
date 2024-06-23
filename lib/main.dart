import 'package:flutter/material.dart';
import 'package:zadaniye2/Screens/Author/AuthorPage.dart';
import 'package:zadaniye2/Screens/Home/HomePage.dart';
import 'package:zadaniye2/Screens/Register/RegisterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 2, 62, 86)),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const RegisterPage(),
        "author": (context) => const AuthorPage(),
        "home": (context) => const HomePage(),
      },
    );
  }
}
