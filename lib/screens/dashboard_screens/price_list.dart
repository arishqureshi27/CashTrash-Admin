import 'package:flutter/material.dart';

class PriceList extends StatelessWidget {
  const PriceList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Item ${index}',
              ),
              Text(
                'Rate : ${index}',
              ),
            ],
          ),
        );
      },
    );
  }
}
