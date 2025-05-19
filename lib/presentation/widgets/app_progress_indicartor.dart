import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  final Color color;
  final double padding;
  final double size;
  const AppProgressIndicator({super.key, required this.color, this.padding = 0, this.size = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),

      height: size,
      width: size,
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
