import 'package:flutter/material.dart';

class BackgroundCirculo extends StatelessWidget {
  const BackgroundCirculo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 520,
      height: 520,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xff1DB954).withOpacity(0.09),
          width: 80,
        )
      ),
    );
  }
}