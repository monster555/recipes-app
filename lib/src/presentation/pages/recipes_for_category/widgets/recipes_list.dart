part of '../recipes_for_category.dart';

class RecipesListForCategory extends StatefulWidget {
  const RecipesListForCategory(this.recipes, {super.key});

  final List<Recipe> recipes;

  @override
  State<RecipesListForCategory> createState() => _RecipesListForCategoryState();
}

class _RecipesListForCategoryState extends State<RecipesListForCategory> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: widget.recipes.length,
      itemBuilder: (context, index) {
        final recipe = widget.recipes[index];
        return OpenContainer(
          transitionDuration: const Duration(milliseconds: 500),
          closedColor: Colors.transparent,
          closedElevation: 0,
          openElevation: 0,
          closedBuilder: (context, action) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                action();
                context.read<RecipesCubit>().getRecipe(recipe.id);
              },
              child: RecipeListItem(recipe)),
          openBuilder: (context, action) => RecipeDetails(recipe),
        );
      },
    );
  }
}
