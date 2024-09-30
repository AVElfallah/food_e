import 'package:flutter/material.dart';

class BoolWidget extends StatelessWidget {
  const BoolWidget(
      {super.key,
      this.condition = false,
      required this.child,
      this.placeHolder = const SizedBox.shrink()});

  final bool? condition;
  final Widget? child;
  final Widget? placeHolder;

  @override
  Widget build(BuildContext context) {
    return condition! ? child! : placeHolder!;
  }
}
