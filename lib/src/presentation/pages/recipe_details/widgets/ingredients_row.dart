import 'package:flutter/material.dart';
import 'package:recipes_app/src/domain/entities/recipe.dart';
import 'package:recipes_app/src/presentation/pages/home/widgets/title_widget.dart';

class Ingredients extends StatelessWidget {
  const Ingredients(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    if (recipe.ingredients.isEmpty) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const TitleWidget('Ingredients'),
          const SizedBox(height: 8),
          if (recipe.ingredients.isNotEmpty)
            for (final ingredient in recipe.ingredients)
              _IngredientRow(ingredient!),
        ],
      ),
    );
  }
}

class _IngredientRow extends StatelessWidget {
  const _IngredientRow(this.ingredient);

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(ingredient.name.trim()),
          const Spacer(),
          Text(
            ingredient.measure.trim(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize),
          ),
        ],
      ),
    );
  }
}
