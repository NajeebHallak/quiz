import 'package:flutter/material.dart';

class ContainerDoneLevel extends StatelessWidget {
  const ContainerDoneLevel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Icon(Icons.check_sharp, size: 50),
    );
  }
}
