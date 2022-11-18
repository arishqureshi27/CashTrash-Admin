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
    const PincodeAdd(),
    RequestHistory(),
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
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(titles[_currentIndex]),
      ),
      drawer: const MyDrawer(),
      body: dashboardScreens[_currentIndex],
      // body: Check(
      //   currentindex: _currentIndex,
      //   dashboardscreens: dashboardScreens,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        iconSize: 24,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.green[900],
        backgroundColor: Colors.green,
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
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee),
            tooltip: 'Pincodes',
            label: 'Pincodes',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            tooltip: 'History',
            label: 'History',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

// class Check extends StatefulWidget {
//   int currentindex;
//   List<Widget> dashboardscreens;

//   Check(
//       {required this.currentindex, required this.dashboardscreens, super.key});

//   @override
//   State<Check> createState() => _CheckState();
// }

// class _CheckState extends State<Check> {
//   @override
//   Widget build(BuildContext context) {
//     if (widget.currentindex != 2) {
//       return PickUpRequest();
//     } else {
//       return widget.dashboardscreens.elementAt(widget.currentindex);
//     }
//   }
// }