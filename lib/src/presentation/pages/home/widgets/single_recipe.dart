import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/core/constants.dart';
import 'package:recipes_app/src/domain/entities/recipe.dart';
import 'package:recipes_app/src/presentation/bloc/recipes/recipes_cubit.dart';
import 'package:recipes_app/src/presentation/widgets/shimmer_image.dart';
import 'package:recipes_app/src/presentation/widgets/shimmer_loading.dart';

class SingleRecipe extends StatelessWidget {
  const SingleRecipe(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesCubit, RecipesState>(
      builder: (context, state) {
        final size = MediaQuery.of(context).size.width - 32;
        if (state.loading || state.loadingRandom) {
          return ClipRRect(
            borderRadius: AppConstants.borderRadius,
            child: ShimmerLoading.square(dimension: size),
          );
        }
        return ClipRRect(
          borderRadius: AppConstants.borderRadius,
          child: Stack(
            children: [
              ShimmerImage(
                height: size,
                width: size,
                image: recipe.image,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: size,
                  height: 64,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(.8),
                      ],
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          recipe.name,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
