import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/misc/AppBar/appbar.dart';

class LoadingPage extends StatelessWidget {
  final Color color;

  const LoadingPage({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: const CustomAppBar(title: "Loading"),
      body: const Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 6.0,
          ),
        ),
      ),
    );
  }
}