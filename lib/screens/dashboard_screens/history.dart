import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/request_history_card.dart';

class RequestHistory extends StatelessWidget {
  const RequestHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('order').where(
        'status',
        whereIn: ['accepted', 'rejected'],
      ).snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && snapshot.data!.docs.length > 0) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot orderData = snapshot.data!.docs[index];
              return RequestHistoryCard(
                orderData: orderData,
              );
            },
          );
        } else if (snapshot.hasData) {
          return const Center(
            child: Text('No Completed Requests'),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
