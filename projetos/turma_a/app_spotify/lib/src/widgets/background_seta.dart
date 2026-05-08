import 'package:flutter/material.dart';

class BackgroundSeta extends StatelessWidget {
  const BackgroundSeta({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.85,
      child: Container(
        width: 430,
        height: 430,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff1DB954).withOpacity(0.10),
            width: 80
          )
        ),
      ),
      );
  }
}