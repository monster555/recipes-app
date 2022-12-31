import 'package:flutter/material.dart';
import 'package:recipes_app/src/domain/entities/recipe.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) => Chip(label: Text(recipe.category));
}
