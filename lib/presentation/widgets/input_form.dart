import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InputForm extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool enable;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  const InputForm({
    super.key,
    this.controller,
    this.validator,
    this.enable = true,
    this.title = '',
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Gap(6),
        TextFormField(
          onChanged: onChanged,
          onTap: onTap,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: readOnly,
          enabled: enable,
          controller: controller,
          validator: validator,
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.black12,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
