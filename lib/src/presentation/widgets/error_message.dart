import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Text(
        message,
        style: theme.textTheme.bodyLarge!.copyWith(
          color: theme.colorScheme.error,
        ),
      ),
    );
  }
}
