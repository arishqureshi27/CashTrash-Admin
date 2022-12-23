import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth101/widgets/rejection_reason.dart';
import 'package:flutter/material.dart';

import '../../widgets/request_card.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('order')
          .where('status', isEqualTo: 'pending')
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && snapshot.data!.docs.length > 0) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot orderData = snapshot.data!.docs[index];
              void onPressed() {
                Map<String, String> dat = {'status': 'accepted'};
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

              void onPressed1() {
                Map<String, String> dat = {'status': 'rejected'};

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
                setState(() {});
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: RejectionReason(),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff35C2C1),
                            ),
                            onPressed: () {
                              Map<String, String> dat = {
                                'reasonRejection': selectedReason!
                              };
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
                            },
                            child: const Text('Select Reason'),
                          ),
                        ],
                      );
                    });
              }

              return RequestCard(
                orderData: orderData,
                onPressed: onPressed,
                text: 'Accept',
                secondButton: true,
                onPressed1: onPressed1,
                text1: 'Reject',
              );
            },
          );
        } else if (snapshot.hasData) {
          return const Center(
            child: Text('No Pending Requests'),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
