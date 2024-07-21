import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final overlayEntryController = OverlayEntryController(null);

class OverlayEntryController extends ValueNotifier<OverlayEntry?> {
  OverlayEntryController(super._value);

  void addEntry(OverlayEntry entry) => value = entry;
  void removeEntry() {
    value?.remove();
    value = null;
  }
}
