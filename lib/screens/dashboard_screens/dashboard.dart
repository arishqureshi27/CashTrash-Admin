import 'package:flutter/material.dart';
import './history.dart';
import 'pincode_add.dart';
import 'requests_page.dart';
import '../../widgets/drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  List<Widget> dashboardScreens = [
    const RequestPage(),
    const AddPincode(),
    const RequestHistory(),
  ];

  List<String> titles = [
    'Pickup Requests',
    'Add Locations',
    'History',
    'History',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF09B1EC),
        title: Text(titles[_currentIndex]),
      ),
      drawer: const MyDrawer(),
      body: dashboardScreens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        iconSize: 24,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xff1E232C),
        backgroundColor: const Color(0xFF09B1EC),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            tooltip: 'Requests',
            label: 'Requests',
            backgroundColor: Color(0xFF09B1EC),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            tooltip: 'Pincodes',
            label: 'Pincodes',
            backgroundColor: Color(0xFF09B1EC),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            tooltip: 'History',
            label: 'History',
            backgroundColor: Color(0xFF09B1EC),
          ),
        ],
      ),
    );
  }
}
