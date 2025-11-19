import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class CustomListShimmer extends StatelessWidget {
  const CustomListShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: 10, // number of shimmer items
      padding: EdgeInsets.only(top: 20, bottom: 100),
      itemBuilder: (context, index) => buildShimmerItem(),
    );
  }
}

Widget buildShimmerItem() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      margin: EdgeInsets.only(bottom: 14),
      padding: EdgeInsets.all(16),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
