import 'package:flutter/material.dart';
import '../widgets/bottm-Bar.dart';
import 'home/addTabs.dart';
import 'home/homeScreen.dart';
import 'home/profile.dart';
import 'home/searchTab.dart'; // We'll still use ProfileTab's drawer logic

class HomeScreenTab extends StatefulWidget {
  @override
  State<HomeScreenTab> createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AdvancedHomeScreen(),
    AnimatedSearchTab(),
    const SizedBox(), // Placeholder for Search tab
    const SizedBox(), // Placeholder for Profile drawer trigger
  ];

  void _showProfileDraw(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // KEY
      builder: (context) => const AddTabDrawer (),
    );
  }


//show profile tab
  void _onTabTapped(int index) {
    if (index == 2) {
      // Show Profile Drawer Sheet instead of changing tab
      _showProfileDraw(context);
    }
     else if (index == 3) {
        // Show Profile Drawer Sheet instead of changing tab
        _showProfileDrawer(context);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _showProfileDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // KEY
      builder: (context) => const ProfileTabDrawer(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: FrostedBottomBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
