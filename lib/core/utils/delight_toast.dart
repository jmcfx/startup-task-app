import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';

/// A reusable toast helper built on top of the delightful_toast package.
class DelightToast {
  final String message;
  final Color backgroundColor;
  final IconData? icon;
  final Duration duration;
  final DelightSnackbarPosition position;

  const DelightToast({
    required this.message,
    this.backgroundColor = Colors.black87,
    this.icon,
    this.duration = const Duration(seconds: 2),
    this.position = DelightSnackbarPosition.top,
  });

  /// Builds the DelightToastBar widget.
  DelightToastBar build() {
    return DelightToastBar(
      autoDismiss: true,
      snackbarDuration: duration,
      position: position,
      builder: (context) => ToastCard(
        color: backgroundColor,
        title: Text(message, style: TextStyle(color: Colors.white)),
        leading: Icon(icon, color: Colors.white),
      ),
    );
  }

  /// Displays the toast immediately.
  void show(BuildContext context) {
    build().show(context);
  }

  /// factory constructor
  factory DelightToast.success({required String message}) {
    return DelightToast(
      message: message,
      backgroundColor: Colors.blueAccent.shade200,
      icon: Icons.check_circle,
    );
  }

  factory DelightToast.error({required String message}) {
    return DelightToast(
      message: message,
      backgroundColor: Colors.redAccent,
      icon: Icons.error_outline,
    );
  }

  factory DelightToast.info({required String message}) {
    return DelightToast(
      message: message,
      backgroundColor: Colors.grey,
      icon: Icons.info_outline,
    );
  }
}
