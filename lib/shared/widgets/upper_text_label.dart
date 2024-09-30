import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        style: GoogleFonts.bebasNeue(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w300,
          color: ColorsHelper.primary,
        ),
      ),
    );
  }
}
