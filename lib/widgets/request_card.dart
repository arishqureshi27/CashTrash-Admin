// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final DocumentSnapshot<Object?> orderData;
  final VoidCallback onPressed;
  final VoidCallback onPressed1;

  const RequestCard({
    Key? key,
    required this.orderData,
    required this.onPressed,
    required this.onPressed1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actionsAlignment: MainAxisAlignment.spaceAround,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff35C2C1),
                      ),
                      onPressed: onPressed,
                      child: const Text('Accept'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff35C2C1),
                      ),
                      onPressed: onPressed1,
                      child: const Text('Reject'),
                    ),
                  ],
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    orderData['image'],
                                  ),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 32,
                        ),

                        const Text(
                          'OrderId:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        Text(orderData['orderId']),
                        const SizedBox(
                          height: 8,
                        ),

                        // Date
                        const Text('Date of Request: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(orderData['date']),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Pickup Date: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(orderData['pickupDate']),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text('Time of Request: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(orderData['time']),
                        const SizedBox(
                          height: 16,
                        ),

                        // Items Requested for Pickup
                        const Text(
                          'Items:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Center(
                          child: Text(orderData['order']
                              .map((e) => e.toString())
                              .toList()
                              .join(', ')),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text('Status: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(orderData['status']),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 140,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              // Image
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        orderData['image'],
                      ),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              // Data
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Date: ${orderData['date']}'),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Pickup Date: ${orderData['pickupDate']}'),
                    const SizedBox(
                      height: 16,
                    ),
                    Text('Item count: ${orderData['order'].length}'),
                    const SizedBox(
                      height: 16,
                    ),
                    Text('Status: ${orderData['status']}'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
