import 'package:flutter/material.dart';

import 'circle_key_animation.dart';

class CustomStackQuiz extends StatelessWidget {
  const CustomStackQuiz({
    super.key,
    required this.choose,
    required this.sizeCircle,
  });

  final int choose;
  final Animation<double> sizeCircle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomRight,
      children: [
        CircleKeyAnimation(
            keyAni: 'Q',
            size: choose == 1 || choose == 5 ? 45 + sizeCircle.value : 45,
            color: const Color(0xffFCDB00)),
        const Positioned(
          bottom: 90,
          left: -20,
          child: CircleAvatar(radius: 15, backgroundColor: Color(0xffFCDB00)),
        ),
        const Positioned(
          bottom: 55,
          left: -30,
          child: CircleAvatar(radius: 10, backgroundColor: Color(0xffFCDB00)),
        ),
        Positioned(
          left: 65,
          bottom: -35,
          child: CircleKeyAnimation(
              keyAni: 'U',
              size: choose == 2 || choose == 5 ? 45 + sizeCircle.value : 45,
              color: Colors.green),
        ),
        const Positioned(
          bottom: 70,
          left: 85,
          child: CircleAvatar(radius: 10, backgroundColor: Colors.green),
        ),
        const Positioned(
          bottom: -40,
          left: 50,
          child: CircleAvatar(radius: 10, backgroundColor: Colors.green),
        ),
        Positioned(
          left: 128,
          child: CircleKeyAnimation(
              keyAni: 'I',
              size: choose == 3 || choose == 5 ? 45 + sizeCircle.value : 45,
              color: const Color(0xff0070F2)),
        ),
        const Positioned(
          bottom: -45,
          left: 160,
          child: CircleAvatar(radius: 15, backgroundColor: Color(0xff0070F2)),
        ),
        const Positioned(
          bottom: 90,
          left: 190,
          child: CircleAvatar(radius: 7, backgroundColor: Color(0xff0070F2)),
        ),
        Positioned(
          left: 190,
          bottom: -35,
          child: CircleKeyAnimation(
              keyAni: 'Z',
              size: choose == 4 || choose == 5 ? 45 + sizeCircle.value : 45,
              color: const Color(0xffF63D35)),
        ),
        const Positioned(
          bottom: -70,
          left: 250,
          child: CircleAvatar(radius: 15, backgroundColor: Color(0xffF63D35)),
        ),
        const Positioned(
          bottom: -30,
          left: 290,
          child: CircleAvatar(radius: 7, backgroundColor: Color(0xffF63D35)),
        ),
      ],
    );
  }
}
