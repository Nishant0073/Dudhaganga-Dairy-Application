import 'package:dudhaganga_app/collectorPages/add_customer.dart';
import 'package:dudhaganga_app/collectorPages/profile_page.dart';
import 'package:dudhaganga_app/collectorPages/user_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  final String userId;
  const HomePage({super.key, required this.userId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedPage = 1;
  Widget currentPage = const UserHomePage();
  void _onSelect(int currentIndex) {
    setState(() {
      _selectedPage = currentIndex;
      if (currentIndex == 0) {
        currentPage = const AddCustomers();
      } else if (currentIndex == 1) {
        currentPage = const UserHomePage();
      } else {
        currentPage = const ProfilePage();
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
            icon: const Icon(Icons.group_add_rounded),
            label: 'add_customer'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'side_bar_home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: 'home_page_profile'.tr,
          ),
        ],
        currentIndex: _selectedPage,
        onTap: _onSelect,
      ),
    );
  }
}
