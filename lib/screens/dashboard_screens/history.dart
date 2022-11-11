import 'package:flutter/material.dart';

class PickUpHistory extends StatelessWidget {
  const PickUpHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(child: Text('Pick Up ${index}'));
        },
        itemCount: 10,
      ),
    );
  }
}
