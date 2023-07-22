import 'package:animated_glitch/animated_glitch.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({
    required this.asset,
    this.size = 200,
    Key? key,
  }) : super(key: key);
  final String asset;
  final double size;

  final _controller = AnimatedGlitchController(
    frequency: const Duration(milliseconds: 500),
    distortionShift: const DistortionShift(count: 100),
    colorChannelShift: const ColorChannelShift(
      colors: [
        Colors.grey,
        Colors.white,
      ],
    ),
    level: 3,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: AnimatedGlitch(
        controller: _controller,
        child: Image.asset(
          asset,
        ),
      ),
    );
  }
}
