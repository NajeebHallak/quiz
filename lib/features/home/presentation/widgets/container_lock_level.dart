import 'package:flutter/material.dart';

class ContainerlockLevel extends StatelessWidget {
  const ContainerlockLevel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Center(child: Icon(Icons.lock, size: 40)),
    );
  }
}
