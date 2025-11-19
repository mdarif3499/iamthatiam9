
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double width;
  final ShapeBorder shape;

  const CustomShimmer({
    super.key,
    required this.height,
    required this.width,
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Material(
        shape: shape,
        color: Colors.grey[300],
        child: SizedBox(height: height, width: width),
      ),
    );
  }
}
