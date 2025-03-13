import 'package:flutter/material.dart';
import 'package:your_snackbar/src/controller/overlay_entry_controller.dart';
import 'package:your_snackbar/src/widget/content.dart';
import 'package:your_snackbar/your_snackbar.dart';

/// {@template your_snackbar}
/// YourSnackbar widget.
/// {@endtemplate}
class YourSnackbar extends StatefulWidget {
  /// {@macro your_snackbar}
  const YourSnackbar({
    super.key,
    required this.snackbarStyle,
    required this.height,
    required this.child,
    required this.direction,
    required this.duration,
  });

  final YourSnackbarStyle snackbarStyle;
  final Widget child;
  final double height;
  final SnackbarDirection direction;
  final Duration duration;

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
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(curve)
      ..addStatusListener(_animationStatusListener);
    _controller.forward();
  }

  void _animationStatusListener(AnimationStatus status) async {
    if (status == AnimationStatus.completed) {
      setState(() => isOpened = true);
      await Future.delayed(widget.duration);
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
    final snackbarStyle = widget.snackbarStyle;

    final height = widget.height;
    return RepaintBoundary(
      child: ListenableBuilder(
        listenable: _animation,
        builder: (BuildContext context, Widget? child) => Transform.translate(
          offset: Offset(
            0,
            getHeight(height, context),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: child,
          ),
        ),
        child: Dismissible(
          key: UniqueKey(),
          direction: widget.direction.onTop
              ? DismissDirection.up
              : DismissDirection.down,
          onDismissed: (direction) => overlayEntryController.removeEntry(),
          child: Content(
            snackbarStyle: snackbarStyle,
            height: widget.height,
            direction: widget.direction,
            child: widget.child,
          ),
        ),
      ),
    );
  }

  double getHeight(double height, BuildContext context) {
    final padding = widget.direction.onTop
        ? widget.snackbarStyle.contentPadding.top
        : widget.snackbarStyle.contentPadding.bottom;

    final side = widget.direction.onTop ? 1 : -1;

    final percent = _animation.value - side;

    final safeArea = widget.direction.onTop
        ? MediaQuery.of(context).padding.top
        : MediaQuery.of(context).padding.bottom;

    final fullHeight = height + safeArea + padding * 2;

    final y = widget.direction.onBottom
        ? MediaQuery.sizeOf(context).height + fullHeight
        : 0.0;
    return y + side * (percent * fullHeight);
  }
}
