import 'package:flutter/material.dart';

extension HexaColor on String {
  Color toColor() => Color(int.parse('0xff$this'));
}
