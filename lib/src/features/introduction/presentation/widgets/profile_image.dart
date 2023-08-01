import 'package:animated_glitch/animated_glitch.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    required this.asset,
    this.size = 200,
    super.key,
  });
  final String asset;
  final double size;

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  late AnimatedGlitchController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimatedGlitchController(
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
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedGlitch(
        controller: _controller,
        child: Image.asset(
          widget.asset,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
