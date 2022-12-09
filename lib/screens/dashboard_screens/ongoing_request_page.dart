import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/request_card.dart';

class OngoingReqPage extends StatefulWidget {
  const OngoingReqPage({super.key});

  @override
  State<OngoingReqPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<OngoingReqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('order')
          .where('status', isEqualTo: 'ongoing')
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && snapshot.data!.docs.length > 0) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot orderData = snapshot.data!.docs[index];
              void onPressed() {
                Map<String, String> dat = {'status': 'completed'};
                setState(() {});
                FirebaseFirestore.instance
                    .collection('order')
                    .doc(orderData['orderId'])
                    .update(dat);
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(orderData['uid'])
                    .collection('orders')
                    .doc(orderData['orderId'])
                    .update(dat);
                Navigator.pop(context);
              }

              return RequestCard(
                orderData: orderData,
                onPressed: onPressed,
                text: 'finished',
                secondButton: false,
                onPressed1: () {},
                text1: '',
              );
            },
          );
        } else if (snapshot.hasData) {
          return const Center(
            child: Text('No Ongoing Requests'),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
