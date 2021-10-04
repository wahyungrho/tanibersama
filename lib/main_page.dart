import 'package:flutter/material.dart';
import 'package:invest_agriculture/menu/menu.dart';
import 'package:invest_agriculture/shared/shared.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  static const List<Widget> widgetOptions = [
    HomePage(),
    Text('Index 1: Business'),
    ProfilePage(),
  ];

  void _ontapItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_present_sharp), label: 'Portfolio'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: blackColor.withOpacity(0.6),
        unselectedItemColor: greyColor,
        onTap: _ontapItem,
      ),
    );
  }
}
