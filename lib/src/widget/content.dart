import 'package:flutter/material.dart';
import 'package:your_snackbar/your_snackbar.dart';

/// {@template content}
/// Content widget.
/// {@endtemplate}
class Content extends StatelessWidget {
  /// {@macro content}
  const Content({
    super.key,
    required this.snackbarStyle,
    required this.height,
    required this.child,
    required this.direction,
  });

  final YourSnackbarStyle snackbarStyle;
  final Widget child;
  final double height;
  final SnackbarDirection direction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: snackbarStyle.contentPadding,
      child: Padding(
        padding: EdgeInsets.only(
          top: direction.onTop ? MediaQuery.of(context).padding.top : 0.0,
          bottom:
              direction.onBottom ? MediaQuery.of(context).padding.bottom : 0.0,
        ),
        child: Material(
          color: Colors.transparent,
          child: DecoratedBox(
            decoration: snackbarStyle.contentDecoration,
            child: SizedBox(
              width: double.infinity,
              height: height,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
