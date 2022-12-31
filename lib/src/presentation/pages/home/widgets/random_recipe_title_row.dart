part of '../home.dart';

class RandomRecipeTitleRow extends StatelessWidget {
  const RandomRecipeTitleRow({super.key, required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          const TitleWidget('Random drink'),
          const Spacer(),
          _RefreshButton(
            isLoading: isLoading,
          )
        ],
      ),
    );
  }
}

class _RefreshButton extends StatelessWidget {
  const _RefreshButton({required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SizedBox(
            width: 40,
            child: CircularProgressIndicator.adaptive(),
          )
        : TextButton.icon(
            onPressed: context.read<RecipesCubit>().getRandomRecipe,
            label: const Text('Refresh'),
            icon: const Icon(Icons.refresh_outlined),
          );
  }
}
