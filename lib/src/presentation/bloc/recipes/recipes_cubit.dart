import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/domain/entities/category.dart';
import 'package:recipes_app/src/domain/entities/recipe.dart';
import 'package:recipes_app/src/domain/repositories/recipes_repository.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit({required this.repository}) : super(const RecipesState());

  final RecipesRepository repository;

  // Let's keep a list of recipes to be able to filter them
  List<Recipe> recipesList = [];

  // Get all categories
  Future<void> getCategories() async {
    emit(state.copyWith(
      loading: true,
      hasError: false,
      errorMessage: '',
    ));

    try {
      final categories = await repository.getCategories();
      emit(state.copyWith(loading: false, categories: categories));
    } catch (e) {
      log('[ERROR] - getCategories: $e');
      emit(state.copyWith(
        loading: false,
        hasError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  // Get a random recipe
  Future<void> getRandomRecipe() async {
    emit(state.copyWith(
      loadingRandom: true,
      randomRecipe: null,
      hasError: false,
      errorMessage: '',
    ));

    try {
      final recipe = await repository.getRandomRecipe();
      emit(state.copyWith(loadingRandom: false, randomRecipe: recipe));
    } catch (e) {
      log('[ERROR] - getRandomRecipes: $e');
      emit(state.copyWith(
        loadingRandom: false,
        hasError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  // Get all recipes for a given category
  Future<void> getRecipesForCategory(String categoryId) async {
    emit(state.copyWith(
      loading: true,
      hasError: false,
      errorMessage: '',
    ));

    try {
      final recipes = await repository.getRecipesForCategory(categoryId);
      recipesList = recipes;
      emit(state.copyWith(loading: false, recipes: recipes));
    } catch (e) {
      log('[ERROR] - getRecipesForCategory: $e');
      emit(state.copyWith(
        loading: false,
        hasError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  // Get a single recipe for a given id
  Future<void> getRecipe(String id) async {
    emit(state.copyWith(
      loadingActual: true,
      actualRecipe: null,
      hasError: false,
      errorMessage: '',
    ));

    try {
      final recipe = await repository.getRecipe(id);
      emit(state.copyWith(loadingActual: false, actualRecipe: recipe));
    } catch (e) {
      log('[ERROR] - getRecipe: $e');
      emit(state.copyWith(
        loadingActual: false,
        hasError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  // Filter recipes by query string
  void searchRecipe(String query) {
    final recipes = recipesList.where((recipe) {
      final title = recipe.name.toLowerCase();
      final queryLowerCase = query.toLowerCase();
      return title.contains(queryLowerCase);
    }).toList();
    emit(state.copyWith(recipes: recipes));
  }

  // Clear search
  void clearSearch() => emit(state.copyWith(recipes: recipesList));
}
