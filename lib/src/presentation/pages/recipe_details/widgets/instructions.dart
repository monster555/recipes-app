import 'package:flutter/material.dart';
import 'package:recipes_app/src/domain/entities/recipe.dart';
import 'package:recipes_app/src/presentation/pages/home/widgets/title_widget.dart';

class Instructions extends StatelessWidget {
  const Instructions(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    if (recipe.instructions.isEmpty) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const TitleWidget('Instructions'),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              recipe.instructions,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                  ),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
