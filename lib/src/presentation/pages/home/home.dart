import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/presentation/bloc/recipes/recipes_cubit.dart';
import 'package:recipes_app/src/presentation/pages/home/widgets/category_list.dart';
import 'package:recipes_app/src/presentation/pages/home/widgets/single_recipe.dart';
import 'package:recipes_app/src/presentation/pages/home/widgets/title_widget.dart';
import 'package:recipes_app/src/presentation/pages/recipe_details/recipe_details.dart';
import 'package:recipes_app/src/presentation/widgets/error_message.dart';

part 'widgets/random_recipe_section.dart';
part 'widgets/random_recipe_title_row.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RecipesCubit>()
      ..getRandomRecipe()
      ..getCategories();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes App'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.value();
        },
        child: BlocBuilder<RecipesCubit, RecipesState>(
          builder: (context, state) {
            if (state.hasError) {
              return ErrorMessage(state.errorMessage!);
            }
            return const SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 32),
                  CategoryList(),
                  SizedBox(height: 16),
                  RandomRecipeSection()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
