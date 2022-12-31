import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/domain/entities/recipe.dart';
import 'package:recipes_app/src/domain/extensions/extensions.dart';
import 'package:recipes_app/src/presentation/bloc/recipes/recipes_cubit.dart';
import 'package:recipes_app/src/presentation/pages/recipe_details/widgets/category_chip.dart';
import 'package:recipes_app/src/presentation/pages/recipe_details/widgets/ingredients_row.dart';
import 'package:recipes_app/src/presentation/pages/recipe_details/widgets/instructions.dart';
import 'package:recipes_app/src/presentation/widgets/error_message.dart';
import 'package:recipes_app/src/presentation/widgets/shimmer_image.dart';
import 'package:recipes_app/src/presentation/widgets/shimmer_loading.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: BlocBuilder<RecipesCubit, RecipesState>(
            builder: (context, state) {
              if (state.hasError) {
                return ErrorMessage(state.errorMessage!);
              }
              if (state.loadingActual) {
                return ShimmerLoading.square(dimension: context.width);
              }
              final actualRecipe = state.actualRecipe;
              return Column(
                children: [
                  Stack(
                    children: [
                      ShimmerImage(
                        image: actualRecipe.image,
                        height: context.width,
                        width: context.width,
                      ),
                      Positioned(
                        right: 16,
                        bottom: 0,
                        child: CategoryChip(actualRecipe),
                      ),
                    ],
                  ),
                  Ingredients(actualRecipe),
                  Instructions(actualRecipe),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                      onPressed: context.pop,
                      label: const Text('Go back'),
                      icon: Icon(Icons.adaptive.arrow_back))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
