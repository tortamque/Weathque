import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/features/app/presentation/widgets/misc/AppBar/appbar.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Loading"),
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            color: CustomColors.black,
            strokeWidth: 6.0,
          ),
        ),
      ),
    );
  }
}