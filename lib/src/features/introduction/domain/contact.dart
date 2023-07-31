import 'package:flutter/material.dart';

class Contact {
  const Contact({
    required this.tooltip,
    required this.url,
    required this.icon,
  });
  final String tooltip;
  final String url;
  final IconData icon;
}
