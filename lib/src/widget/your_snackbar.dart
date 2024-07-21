import 'package:flutter/material.dart';
import 'package:your_snackbar/src/controller/overlay_entry_controller.dart';
import 'package:your_snackbar/src/widget/content.dart';
import 'package:your_snackbar/src/widget/your_snackbar_style.dart';

/// {@template your_snackbar}
/// YourSnackbar widget.
/// {@endtemplate}
class YourSnackbar extends StatefulWidget {
  /// {@macro your_snackbar}
  const YourSnackbar({super.key, this.snackbarStyle});

  final YourSnackbarStyle? snackbarStyle;

  @override
  State<YourSnackbar> createState() => _YourSnackbarState();
}

/// State for widget YourSnackbar.
class _YourSnackbarState extends State<YourSnackbar>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  bool isOpened = false;

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
      vsync: this,
    );
    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
      reverseCurve: Curves.easeInOutExpo,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(curve)
      ..addStatusListener(_animationStatusListener);
    _controller.forward();
  }

  void _animationStatusListener(AnimationStatus status) async {
    if (status == AnimationStatus.completed) {
      setState(() => isOpened = true);
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;
      _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      overlayEntryController.removeEntry();
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_animationStatusListener);
    _controller.dispose();
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) => Transform.translate(
          offset: Offset(0, (_animation.value - 1) * 100),
          child: Align(
            alignment: Alignment.topLeft,
            child: child,
          ),
        ),
        child: Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.up,
          onDismissed: (direction) => overlayEntryController.removeEntry(),
          child: Content(
            snackbarStyle:
                widget.snackbarStyle ?? YourSnackbarStyle.defaultStyle(context),
          ),
        ),
      ),
    );
  }
}
