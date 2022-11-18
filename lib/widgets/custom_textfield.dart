import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController myController;
  final String? hintText;
  final TextInputType inputType;

  const CustomTextField({
    Key? key,
    required this.myController,
    this.hintText,
    required this.inputType,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomizedTextfieldState();
}

class _CustomizedTextfieldState extends State<CustomTextField> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.myController,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        fillColor: const Color(0xffE8ECF4),
        filled: true,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
