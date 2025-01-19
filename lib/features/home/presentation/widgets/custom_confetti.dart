import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CustomConfetti extends StatelessWidget {
  const CustomConfetti({
    super.key,
    required this.confettiController,
  });

  final ConfettiController confettiController;

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: confettiController,
      blastDirectionality: BlastDirectionality.explosive, // اتجاه الانتشار
      numberOfParticles: 200,
      shouldLoop: false, // لتكرار الاحتفال
      colors: const [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.yellow
      ], // الألوان
    );
  }
}
