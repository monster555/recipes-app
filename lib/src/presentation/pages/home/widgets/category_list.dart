import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/presentation/bloc/recipes/recipes_cubit.dart';
import 'package:recipes_app/src/presentation/pages/home/widgets/title_widget.dart';
import 'package:recipes_app/src/presentation/pages/recipes_for_category/recipes_for_category.dart';
import 'package:recipes_app/src/presentation/widgets/shimmer_loading.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesCubit, RecipesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleWidget('Categories'),
              const SizedBox(height: 8),
              if (state.loading)
                const _LoadingCategories()
              else
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.categories
                        .map(
                          (category) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: OpenContainer(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              closedElevation: 0,
                              openElevation: 0,
                              closedColor: Colors.transparent,
                              openColor: Colors.transparent,
                              closedBuilder: (context, action) => Chip(
                                label: Text(category.name),
                              ),
                              openBuilder: (context, action) =>
                                  RecipesForCategory(category.name),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _LoadingCategories extends StatelessWidget {
  const _LoadingCategories();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: ShimmerLoading(
              height: 48,
              width: MediaQuery.of(context).size.width / 3,
            ),
          ),
        );
      })),
    );
  }
}
