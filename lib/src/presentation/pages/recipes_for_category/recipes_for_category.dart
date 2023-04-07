import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/core/constants.dart';
import 'package:recipes_app/src/domain/entities/recipe.dart';
import 'package:recipes_app/src/domain/extensions/extensions.dart';
import 'package:recipes_app/src/presentation/bloc/recipes/recipes_cubit.dart';
import 'package:recipes_app/src/presentation/pages/recipe_details/recipe_details.dart';
import 'package:recipes_app/src/presentation/widgets/custom_card.dart';
import 'package:recipes_app/src/presentation/widgets/error_message.dart';
import 'package:recipes_app/src/presentation/widgets/shimmer_image.dart';
import 'package:recipes_app/src/presentation/widgets/shimmer_loading.dart';

part 'widgets/loading_recipes_list.dart';
part 'widgets/recipe_list_item.dart';
part 'widgets/recipes_list.dart';

class RecipesForCategory extends StatefulWidget {
  const RecipesForCategory(this.category, {super.key});

  final String category;

  @override
  State<RecipesForCategory> createState() => _RecipesForCategoryState();
}

class _RecipesForCategoryState extends State<RecipesForCategory> {
  bool showSearch = false;

  late RecipesCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<RecipesCubit>()
      ..getRecipesForCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !showSearch
            ? Text(widget.category)
            : TextField(
                autofocus: true,
                onChanged: cubit.searchRecipe,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
        actions: [
          IconButton(
            icon:
                showSearch ? const Icon(Icons.close) : const Icon(Icons.search),
            onPressed: () {
              cubit.clearSearch();
              setState(() => showSearch = !showSearch);
            },
          ),
        ],
      ),
      body: BlocBuilder<RecipesCubit, RecipesState>(
        builder: (context, state) {
          if (state.hasError) {
            return ErrorMessage(state.errorMessage!);
          }
          if (state.loading) {
            return const LoadingRecipes();
          }
          return RecipesListForCategory(state.recipes);
        },
      ),
    );
  }
}
