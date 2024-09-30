import 'package:flutter/material.dart';

class PageRouteSlidable extends PageRoute {
  PageRouteSlidable({
    this.page,
    this.maintainState = true,
    super.settings,
  });
  final Widget? Function(dynamic)? page;
  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: page?.call(context) ?? const Text('ERROR!!'),
    );
  }

  @override
  final bool maintainState;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
