import 'package:flutter/material.dart';
import 'package:prueba_tecnica_avila_tek/presentation/widgets/app_progress_indicartor.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final bool enabled;
  final bool loading;
  const AppButton({
    super.key,
    this.onPressed,
    this.title = '',
    this.enabled = true,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.fromLTRB(5, 14, 5, 14)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        elevation: WidgetStatePropertyAll(0),
        backgroundColor: WidgetStatePropertyAll(enabled ? Colors.black : Colors.black26),
      ),
      child:
          loading
              ? AppProgressIndicator(color: Colors.white, size: 22)
              : Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                ),
              ),
    );
  }
}
