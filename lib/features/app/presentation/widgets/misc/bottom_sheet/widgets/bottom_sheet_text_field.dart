import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomSheetTextField extends StatelessWidget {
  final TextEditingController controller;
  final FToast toastManager;
  final Function(FToast toastManager, BuildContext context) onSubmit;

  const BottomSheetTextField({super.key, required this.controller, required this.toastManager, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) {
        onSubmit(toastManager, context);
      },
      textCapitalization: TextCapitalization.words,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.black)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.black)
        ),
        hintText: "Enter a city",
        labelText: "City",
        labelStyle: TextStyle(
          color: Colors.black
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {
            onSubmit(toastManager, context);
          },
        )
      ),
    );
  }
}