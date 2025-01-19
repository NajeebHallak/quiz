import 'package:flutter/material.dart';

class PageToMoveToAnotherRegistration extends StatelessWidget {
  const PageToMoveToAnotherRegistration({
    super.key,
    required this.onTap,
    required this.text1,
    required this.text2,
  });
  final void Function()? onTap;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2,
            style: const TextStyle(fontSize: 15, color: Color(0xFFC7EDE6)),
          ),
        ),
      ],
    );
  }
}
