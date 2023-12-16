import 'package:flutter/material.dart';
import 'package:wise_clone/screens/home.dart';
import 'package:wise_clone/main.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}
List<Widget> screens =const[
  HomeScreen(),
  HomeScreen(),
  HomeScreen(),
  HomeScreen(),
  HomeScreen()
  ];
class _MainViewState extends State<MainView> {
  int? currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: screens[currentIndex??0],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
items: [
  const BottomNavigationBarItem(icon:Icon(Icons.other_houses_outlined),label: 'Home'),
  const BottomNavigationBarItem(icon:Icon(Icons.credit_card),label: 'Card'),
  BottomNavigationBarItem(icon:CircleAvatar(
    backgroundColor: mainColor,
    child: const Icon(Icons.arrow_upward_rounded)),label: 'Send'),
  const BottomNavigationBarItem(icon:Icon(Icons.people_alt_outlined),label: 'Recipients'),
  const BottomNavigationBarItem(icon:Icon(Icons.category_sharp),label: 'Manage'),
  ],
  onTap: (index) {
    currentIndex = index;
    setState(() {
      
    });
  },
  currentIndex: currentIndex??0,
      ),
    );
  }
}