import 'package:flutter/material.dart';
import 'package:recipes_app/src/core/constants.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppConstants.borderRadius,
        border: Border.all(
          color: colorScheme.onSurface.withOpacity(0.12),
        ),
      ),
      child: child,
    );
  }
}
