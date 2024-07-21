// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:your_snackbar/src/extensions/ctx_extension.dart';

class YourSnackbarStyle {
  final BoxDecoration contentDecoration;
  final EdgeInsets contentPadding;
  YourSnackbarStyle({
    this.contentDecoration = const BoxDecoration(color: Colors.black),
    this.contentPadding = const EdgeInsets.all(8.0),
  });

  factory YourSnackbarStyle.defaultStyle(BuildContext context) =>
      YourSnackbarStyle(
        contentDecoration: BoxDecoration(
          color: context.theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.all(8.0),
      );
}
