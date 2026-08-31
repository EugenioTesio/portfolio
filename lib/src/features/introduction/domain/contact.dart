import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contact {
  const Contact({required this.tooltip, required this.url, required this.icon});
  final String tooltip;
  final String url;
  final FaIconData icon;
}
