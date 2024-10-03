import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';

import '../../helpers/colors_helper.dart';

class UpperTextLabel extends StatefulWidget {
  const UpperTextLabel(this.text,
      {super.key, this.fontSize = 17, this.padding});
  final String text;
  final double fontSize;
  final EdgeInsets? padding;

  @override
  State<UpperTextLabel> createState() => _UpperTextLabelState();
}

class _UpperTextLabelState extends State<UpperTextLabel> {
  late final EdgeInsets pad;
  @override
  void initState() {
    super.initState();
    pad = widget.padding ?? const EdgeInsets.only(left: 25);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pad,
      child: Text(
        widget.text,
        style: context.textTheme.labelSmall?.copyWith(
          color: ColorsHelper.primary,
        ),
      ),
    );
  }
}
