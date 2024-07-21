import 'package:flutter/material.dart';
import 'package:your_snackbar/src/controller/overlay_entry_controller.dart';
import 'package:your_snackbar/src/widget/your_snackbar.dart';

void showYourSnackbar(BuildContext context) {
  final overlay = Overlay.of(context);
  overlayEntryController.removeEntry();
  final entry = OverlayEntry(
    builder: (_) => const YourSnackbar(),
  );
  overlay.insert(entry);
  overlayEntryController.addEntry(entry);
}
