import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';

import '../../../helpers/colors_helper.dart';

class CustomInputDecoration extends InputDecoration {
  const CustomInputDecoration(BuildContext context,
      {super.fillColor,
      super.filled = true,
      super.suffixIcon,
      super.hintText,
      super.border = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      )});

  factory CustomInputDecoration.basicTextFormField(
    BuildContext context, {
    Color? fillColor,
    bool? filled = true,
    Widget? suffixIcon,
    String? hintText,
    InputBorder? border,
  }) {
    return CustomInputDecoration(
      context,
      fillColor: fillColor ??
          (context.isDarkTheme ? Colors.white : ColorsHelper.light),
      filled: filled ?? true,
      suffixIcon: suffixIcon,
      hintText: hintText,
      border: border ??
          (OutlineInputBorder(
            borderSide:
                context.isDarkTheme ? const BorderSide() : BorderSide.none,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
          )),
    );
  }

  factory CustomInputDecoration.password(
    BuildContext context, {
    Color? fillColor,
    bool? filled = true,
    String? hintText,
    void Function()? onPasswordIconPressed,
    InputBorder? border,
  }) {
    return CustomInputDecoration(
      context,
      fillColor: fillColor ??
          (context.isDarkTheme ? Colors.white : ColorsHelper.light),
      filled: filled ?? true,
      suffixIcon: IconButton(
        onPressed: onPasswordIconPressed,
        icon: const Icon(
          Icons.visibility,
          color: ColorsHelper.primary,
        ),
      ),
      hintText: hintText,
      border: border ??
          (OutlineInputBorder(
            borderSide:
                context.isDarkTheme ? const BorderSide() : BorderSide.none,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
          )),
    );
  }
}
