import 'package:flutter/material.dart';

class RoleModelAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const RoleModelAppbarWidget._({super.key, required this.preferredSize});

  factory RoleModelAppbarWidget(BuildContext context, {Key? key}) {
    double height = MediaQuery.of(context).size.height;

    return RoleModelAppbarWidget._(
      preferredSize: Size.fromHeight(
        height * .1,
      ),
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.close),
        style: IconButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  final Size preferredSize;
}
