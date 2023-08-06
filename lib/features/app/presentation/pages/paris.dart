import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/appBar/appbar.dart';
import 'package:weathque/features/app/presentation/widgets/core/menu.dart';

class ParisPage extends StatelessWidget {
  const ParisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Paris"),
      body: Row(
      children: [
          const Spacer(flex: 1,),
          Menu(),
          const Spacer(flex: 1,),
        ],
      ),
    );
  }
}