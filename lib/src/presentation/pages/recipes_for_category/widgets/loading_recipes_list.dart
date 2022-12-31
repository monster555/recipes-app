part of '../recipes_for_category.dart';

class LoadingRecipes extends StatelessWidget {
  const LoadingRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ClipRRect(
            borderRadius: AppConstants.borderRadius,
            child: ShimmerLoading(width: context.width - 32, height: 96),
          ),
        );
      },
    );
  }
}
