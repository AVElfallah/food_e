import 'package:flutter/material.dart';

import '../../../helpers/colors_helper.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: ColorsHelper.primary,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () {
        // Define navigation action here
        onTap?.call();
      },
    );
  }
}
