import 'package:flutter/material.dart';
import 'package:your_snackbar/src/controller/overlay_entry_controller.dart';
import 'package:your_snackbar/src/widget/your_snackbar.dart';

void showYourSnackbar(BuildContext context, {required Widget child}) {
  final overlay = Overlay.of(context);
  overlayEntryController.removeEntry();
  final entry = OverlayEntry(
    builder: (_) => YourSnackbar(child: child),
  );
  overlay.insert(entry);
  overlayEntryController.addEntry(entry);
}
