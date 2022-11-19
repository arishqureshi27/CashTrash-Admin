import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPincode extends StatefulWidget {
  const AddPincode({super.key});

  @override
  State<AddPincode> createState() => _CheckPincodeState();
}

class _CheckPincodeState extends State<AddPincode> {
  static final TextEditingController _controller = TextEditingController();
  bool showError = false;
  List<String> pincodes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fillList(pincodes);
  }

  @override
  Widget build(BuildContext context) {
    fillList(pincodes);
    return AlertDialog(
      title: Text(
        'Add Pincode',
        style: GoogleFonts.lato(fontSize: 24),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // TextField to Enter Pincode
      content: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.number,
        maxLength: 6,
        decoration: InputDecoration(
          errorText: showError ? 'Please Enter Pincode' : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: 'Enter Pincode',
          hintText: 'Enter Pincode',
        ),
        onChanged: (value) {
          if (value.isEmpty) {
            setState(() {
              showError = true;
            });
          } else {
            setState(() {
              showError = false;
            });
          }
        },
      ),

      // Actions
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff35C2C1),
          ),
          onPressed: () {
            if (_controller.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Enter Pincode'),
                ),
              );
            } else if (_controller.text.isNotEmpty &&
                pincodes.contains(_controller.text)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Pincode Already Exists'),
                ),
              );
            } else {
              FirebaseFirestore.instance
                  .collection('pincode')
                  .add({'pincode': _controller.text}).then(
                      (value) => showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Text('Pincode Added Successfully'),
                            );
                          }));
            }
          },
          child: const Text('Add Pincode'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}

void fillList(pincodes) async {
  var doc = await FirebaseFirestore.instance.collection('pincode').get();
  for (int i = 0; i < doc.docs.length; i++) {
    pincodes.add(doc.docs[i].data()['pincode']);
  }
}
