import 'package:flutter/material.dart';

class TechnologyChip extends StatelessWidget {
  const TechnologyChip({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IgnorePointer(
        child: Chip(
          label: Text(
            name,
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondaryContainer),
          ),
          backgroundColor: Colors.black,
          side: BorderSide.none,
        ),
      ),
    );
  }
}
