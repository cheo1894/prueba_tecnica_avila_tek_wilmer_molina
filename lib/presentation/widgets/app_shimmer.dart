import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final Widget widget;
  const AppShimmer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      period: Duration(milliseconds: 500),
      child: widget,
      baseColor: Colors.black12,
      highlightColor: Colors.black26,
    );
  }
}
