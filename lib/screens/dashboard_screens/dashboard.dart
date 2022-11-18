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
    'Home',
    'Prices',
    'Request Pickup',
    'History',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff35C2C1),
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
        unselectedItemColor: Colors.blueGrey,
        backgroundColor: Color(0xff35C2C1),
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
            backgroundColor: Color(0xff35C2C1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee),
            tooltip: 'Pincodes',
            label: 'Pincodes',
            backgroundColor: Color(0xff35C2C1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            tooltip: 'History',
            label: 'History',
            backgroundColor: Color(0xff35C2C1),
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