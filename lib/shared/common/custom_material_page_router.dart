/// A custom implementation of [MaterialPageRoute] that allows conditional
/// navigation based on a provided condition.
///
/// This class provides a factory constructor [CustomMaterialPageRouter.withCondition]
/// which takes a boolean [condition], a [successPage] widget, and a [failurePage] widget.
/// Depending on the value of [condition], it navigates to either the [successPage] or
/// the [failurePage].
///
/// Example usage:
/// ```dart
/// Navigator.of(context).push(
///   CustomMaterialPageRouter.withCondition(
///     condition: someCondition,
///     successPage: SuccessPage(),
///     failurePage: FailurePage(),
///   ),
/// );
/// ```
///
/// - [condition]: A boolean value that determines which page to navigate to.
/// - [successPage]: The widget to display if [condition] is true.
/// - [failurePage]: The widget to display if [condition] is false. Defaults to an empty widget.
library;

import 'package:flutter/material.dart';

class CustomMaterialPageRouter extends MaterialPageRoute {
  CustomMaterialPageRouter._({required super.builder, super.settings});

  factory CustomMaterialPageRouter.withCondition({
    bool condition = true,
    Widget? successPage,
    Widget failurePage = const SizedBox.shrink(),
    RouteSettings? settings,
  }) =>
      CustomMaterialPageRouter._(
        builder: (context) => condition ? successPage! : failurePage,
        settings: settings,
      );
}
