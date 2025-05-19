import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/app_modal_bottom_sheet.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/input_form.dart';

class AppSelect extends StatelessWidget {
  final String title;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final List dataList;
  final String modalTitle;
  final TextEditingController? controller;
  final void Function(Map)? onTap;
  const AppSelect({
    super.key,
    this.title = '',
    this.prefixIcon,
    this.sufixIcon,
    this.dataList = const [],
    this.modalTitle = '',
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InputForm(
      onTap: () {
        modalList(context);
      },

      controller: controller,
      prefixIcon: prefixIcon,
      title: title,
      readOnly: true,
      suffixIcon:
          sufixIcon ??
          IconButton(
            onPressed: () {
              modalList(context);
            },
            icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
          ),
    );
  }

  Future<dynamic> modalList(BuildContext context) {
    return appModalBottomSheet(
      context,
      modalTitle,
      dataList.length > 0
          ? Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(20, 10, 20, Platform.isAndroid ? 20 : 40),
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (onTap == null) return;

                    onTap!(dataList[index]);
                    Navigator.pop(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(dataList[index]?['value'] ?? '', style: TextStyle(fontSize: 16)),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              if (onTap == null) return;

                              onTap!(dataList[index]);
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
            ),
          )
          : SizedBox(
            height: 100,
            width: double.infinity,
            child: Center(child: Text('No data found')),
          ),
    );
  }
}
