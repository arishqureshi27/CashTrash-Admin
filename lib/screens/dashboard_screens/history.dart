import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/request_card.dart';
import '../../widgets/request_history_card.dart';

class RequestHistory extends StatelessWidget {
  const RequestHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('order')
          .where('status', isNotEqualTo: 'pending')
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot orderData = snapshot.data!.docs[index];
                  return RequestHistoryCard(
                    orderData: orderData,
                  );
                },
              )
            : const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
