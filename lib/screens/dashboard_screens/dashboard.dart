import 'package:flutter/material.dart';

import './history.dart';
import './pickup_req.dart';
import './homescreen.dart';
import './price_list.dart';

import '../../widgets/drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  List<Widget> dashboardScreens = [
    const HomeScreen(),
    const PriceList(),
    const PickUpRequest(),
    const PickUpHistory(),
  ];

  List<String> titles = [
    'Home',
    'Prices',
    'Request Pickup',
    'History',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(titles[_currentIndex]),
      ),
      drawer: MyDrawer(),
      body: dashboardScreens.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        iconSize: 26,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.green[900],
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee),
            label: 'Price',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            label: 'Request',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
