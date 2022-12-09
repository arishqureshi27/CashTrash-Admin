import 'package:flutter/material.dart';

String? selectedReason;

class RejectionReason extends StatefulWidget {
  RejectionReason({
    Key? key,
  }) : super(key: key);

  @override
  State<RejectionReason> createState() => _TimeSlotWidgetState();
}

class _TimeSlotWidgetState extends State<RejectionReason> {
  final List<String> timeSlot = [
    'Invalid Pincode',
    'Invalid Address',
    'Invalid Phone',
    'The quantity of waste is below minimum weight',
    'Time Slot not available',
    'Services are currently unavailable, will be resumed shortly'
  ];

  @override
  Widget build(BuildContext context) {
    String? timeslot;
    return Row(
      children: [
        Icon(
          Icons.edit_note,
          color: Colors.grey[600],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SizedBox(
            width: 165,
            child: DropdownButtonFormField<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  fillColor: Colors.amber,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.black38,
                    ),
                  ),
                ),
                value: timeslot,
                items: timeSlot
                    .map(
                      (slot) => DropdownMenuItem<String>(
                        value: slot,
                        child: Text(slot, overflow: TextOverflow.ellipsis),
                      ),
                    )
                    .toList(),
                onChanged: (slot) => setState(() {
                      timeslot = slot;
                      selectedReason = slot!;
                      print(selectedReason);
                    })),
          ),
        ),
      ],
    );
  }
}
