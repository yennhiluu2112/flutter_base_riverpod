import 'package:flutter/material.dart';
import 'package:flutter_base_riverpod/global/themes/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWrapper extends StatelessWidget {
  const ShimmerWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyG200,
      highlightColor: AppColors.backgroundLight,
      child: child,
    );
  }
}
