import 'package:flutter/material.dart';

class AppIconTextButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final void Function()? onPressed;
  const AppIconTextButton({super.key, required this.icon, this.title = '', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: icon,
          iconSize: 40,
          style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
        ),
        Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0)),
      ],
    );
  }
}
