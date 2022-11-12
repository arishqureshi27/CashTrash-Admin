import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
