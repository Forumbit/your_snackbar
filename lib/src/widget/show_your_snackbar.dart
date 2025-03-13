import 'package:flutter/material.dart';
import 'package:your_snackbar/src/controller/overlay_entry_controller.dart';
import 'package:your_snackbar/src/widget/your_snackbar.dart';
import 'package:your_snackbar/src/widget/your_snackbar_style.dart';

enum SnackbarDirection {
  top,
  bottom;

  bool get onTop => this == top;
  bool get onBottom => this == bottom;
}

void showYourSnackbar(
  BuildContext context, {
  required Widget child,
  YourSnackbarStyle? style,
  SnackbarDirection direction = SnackbarDirection.top,
  Duration duration = const Duration(seconds: 1),
  required double height,
}) {
  final overlay = Overlay.of(context);
  overlayEntryController.removeEntry();
  final entry = OverlayEntry(
    builder: (_) => YourSnackbar(
      height: height,
      snackbarStyle: style ?? YourSnackbarStyle.defaultStyle(context),
      direction: direction,
      duration: duration,
      child: child,
    ),
  );
  overlay.insert(entry);
  overlayEntryController.addEntry(entry);
}
