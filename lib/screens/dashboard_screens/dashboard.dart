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
    //const PriceList(),
    const PickUpRequest(),
    const PickUpHistory(),
  ];

  List<String> titles = [
    'Pickup Requests',
    //'Prices',
    'Allow Locations',
    'History',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF09B1EC),
        title: Text(titles[_currentIndex]),
      ),
      drawer: MyDrawer(
        // child:
      ),
      body: dashboardScreens.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF09B1EC),
        selectedFontSize: 16,
        iconSize: 26,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFF003F59),
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pickup Requests',
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Locations',
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
            //backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
