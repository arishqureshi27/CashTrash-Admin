import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/request_card.dart';

class RequestHistory extends StatelessWidget {
  const RequestHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('order')
          .where('status', isEqualTo: 'accepted')
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot orderData = snapshot.data!.docs[index];
                  return RequestCard(
                      orderData: orderData,
                      onPressed: () => Navigator.pop(context),
                      buttonText: 'OK');
                },
              )
            : const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
