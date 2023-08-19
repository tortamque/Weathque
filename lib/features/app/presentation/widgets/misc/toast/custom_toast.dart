import 'package:flutter/material.dart';

class CustomToast extends StatelessWidget {
  final String text;
  final bool isError;

  const CustomToast({super.key, required this.text, required this.isError});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: isError ? Colors.redAccent : Colors.greenAccent,
        ),
        child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            Icon(isError ? Icons.error_outline : Icons.check),
            SizedBox(
            width: 12.0,
            ),
            Text(text),
        ],
        ),
    );
  }
}