import 'package:flutter/material.dart';

void showAppLoadingDialog(BuildContext context, {String? message}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withValues(alpha: 0.3),
    builder: (_) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const CircularProgressIndicator.adaptive()],
      ),
    ),
  );
}
