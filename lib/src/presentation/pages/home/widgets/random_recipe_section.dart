part of '../home.dart';

class RandomRecipeSection extends StatelessWidget {
  const RandomRecipeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesCubit, RecipesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              RandomRecipeTitleRow(
                isLoading: state.loadingRandom || state.loading,
              ),
              const SizedBox(height: 8),
              OpenContainer(
                transitionDuration: const Duration(milliseconds: 500),
                closedColor: Colors.transparent,
                closedElevation: 0,
                openElevation: 0,
                closedBuilder: (context, action) {
                  return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        // Navigate to the details page
                        action();
                        // Fetch the recipe details
                        context
                            .read<RecipesCubit>()
                            .getRecipe(state.randomRecipe.id);
                      },
                      child: SingleRecipe(state.randomRecipe));
                },
                openBuilder: (context, action) =>
                    RecipeDetails(state.randomRecipe),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
