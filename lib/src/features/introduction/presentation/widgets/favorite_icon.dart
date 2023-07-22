import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteIcon extends ConsumerWidget {
  const FavoriteIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Icon(
      Icons.favorite,
      color: Theme.of(context).colorScheme.secondaryContainer,
    );
  }
}
