import 'package:dudhaganga_app/collectorPages/profile_page.dart';
import 'package:dudhaganga_app/collectorPages/user_home_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedPage = 1;
  Widget currentPage = UserHomePage();
  void _onSelect(int currentIndex) {
    setState(() {
      _selectedPage = currentIndex;
      if (currentIndex == 0) {
        currentPage = const Text("ADD CUSTOMERS");
      } else if (currentIndex == 1) {
        currentPage = UserHomePage();
      } else {
        currentPage = ProfilePage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: currentPage),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add_rounded),
            label: 'Add Customer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedPage,
        onTap: _onSelect,
      ),
    );
  }
}
