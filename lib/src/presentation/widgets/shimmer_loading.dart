import 'package:flutter/material.dart';
import 'package:recipes_app/src/core/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
    required this.width,
    required this.height,
    this.dimension = 0,
  });

  final double width;
  final double height;
  final double dimension;

  const ShimmerLoading.square({super.key, required this.dimension})
      : width = dimension,
        height = dimension;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: AppConstants.borderRadius,
      ),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.outline.withOpacity(.1),
        highlightColor: Theme.of(context).colorScheme.outline.withOpacity(.3),
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
        ),
      ),
    );
  }
}
