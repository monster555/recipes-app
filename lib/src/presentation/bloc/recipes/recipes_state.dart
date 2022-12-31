part of 'recipes_cubit.dart';

class RecipesState extends Equatable {
  const RecipesState({
    this.loading = false,
    this.recipes = const [],
    this.loadingRandom = false,
    this.categories = const [],
    this.randomRecipe = const Recipe(),
    this.loadingActual = false,
    this.actualRecipe = const Recipe(),
    this.hasError = false,
    this.errorMessage,
  });

  final bool loading;
  final List<Recipe> recipes;
  final bool loadingRandom;
  final Recipe randomRecipe;
  final bool loadingActual;
  final Recipe actualRecipe;
  final List<Category> categories;
  final bool hasError;
  final String? errorMessage;

  RecipesState copyWith({
    bool? loading,
    List<Recipe>? recipes,
    bool? loadingRandom,
    Recipe? randomRecipe,
    bool? loadingActual,
    Recipe? actualRecipe,
    List<Category>? categories,
    bool? hasError,
    String? errorMessage,
  }) =>
      RecipesState(
        loading: loading ?? this.loading,
        recipes: recipes ?? this.recipes,
        loadingRandom: loadingRandom ?? this.loadingRandom,
        randomRecipe: randomRecipe ?? this.randomRecipe,
        loadingActual: loadingActual ?? this.loadingActual,
        actualRecipe: actualRecipe ?? this.actualRecipe,
        categories: categories ?? this.categories,
        hasError: hasError ?? this.hasError,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object> get props => [
        loading,
        recipes,
        loadingRandom,
        randomRecipe,
        loadingActual,
        actualRecipe,
        categories,
        hasError,
      ];
}
