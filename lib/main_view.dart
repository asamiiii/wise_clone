import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wise_clone/card.dart';
import 'package:wise_clone/home.dart';
import 'package:wise_clone/main.dart';
import 'package:wise_clone/manage.dart';
import 'package:wise_clone/rep.dart';
import 'package:wise_clone/send.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}
List<Widget> screens =[
  HomeScreen(),
  CardScreen(),
  SendScreen(),
  RepScreen(),
  ManageScreen()
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
  BottomNavigationBarItem(icon:Icon(Icons.other_houses_outlined),label: 'Home'),
  BottomNavigationBarItem(icon:Icon(Icons.credit_card),label: 'Card'),
  BottomNavigationBarItem(icon:CircleAvatar(
    backgroundColor: mainColor,
    child: Icon(Icons.arrow_upward_rounded)),label: 'Send'),
  BottomNavigationBarItem(icon:Icon(Icons.people_alt_outlined),label: 'Recipients'),
  BottomNavigationBarItem(icon:Icon(Icons.category_sharp),label: 'Manage'),
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