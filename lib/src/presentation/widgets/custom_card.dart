import 'package:flutter/material.dart';
import 'package:recipes_app/src/core/constants.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: AppConstants.borderRadius,
      ),
      child: child,
    );
  }
}
