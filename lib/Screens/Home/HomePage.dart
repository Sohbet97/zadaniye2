import 'package:flutter/material.dart';
import 'package:zadaniye2/Screens/Products/ProductsPage.dart';
import 'package:zadaniye2/Screens/Settings/PersonPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> items = const [ProductsPage(), PersonPage()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: items[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "1"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "2"),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
