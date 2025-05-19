import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Future<dynamic> appModalBottomSheet(BuildContext context, String title, Widget widget) {
  return showModalBottomSheet(
    context: context,
    builder:
        (context) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black12)),
                  ),
                ],
              ),
            ),
            Gap(6),

            widget,
          ],
        ),
  );
}
