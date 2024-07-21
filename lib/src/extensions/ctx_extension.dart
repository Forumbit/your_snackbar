import 'package:flutter/material.dart';

extension CtxExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
