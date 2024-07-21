import 'package:flutter/material.dart';
import 'package:your_snackbar/src/widget/your_snackbar_style.dart';

/// {@template content}
/// Content widget.
/// {@endtemplate}
class Content extends StatelessWidget {
  /// {@macro content}
  const Content({
    super.key,
    required this.snackbarStyle,
    required this.child,
  });

  final YourSnackbarStyle snackbarStyle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: snackbarStyle.contentPadding,
      child: Material(
        color: Colors.transparent,
        child: DecoratedBox(
          decoration: snackbarStyle.contentDecoration,
          child: SizedBox(
            width: double.infinity,
            height: 80,
            child: child,
          ),
        ),
      ),
    );
  }
}
