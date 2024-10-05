import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';

import '../common/show_menu.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({super.key, required this.optionList});
  final List<String> optionList;

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animeController;
  late final GlobalKey iconGlobalKey;
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();

    /// Initializes the global key for the icon, the text editing controller,
    /// and the animation controller with a specified duration. Adds a status
    /// listener to the animation controller to trigger a state update on status change.
    iconGlobalKey = GlobalKey();

    ///
    _textEditingController = TextEditingController();

    ///
    _animeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    ///
    _animeController.addStatusListener((s) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: context.width * .75,
      decoration: BoxDecoration(
        color: context.isDarkTheme ? Colors.white : ColorsHelper.light,
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _textEditingController.text.isEmpty
                ? 'Country'
                : _textEditingController.text,
            style: context.textTheme.bodyMedium?.copyWith(
              color: _textEditingController.text.isEmpty
                  ? Colors.grey
                  : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            key: iconGlobalKey,
            onTap: () {
              if (_animeController.isCompleted) {
                _animeController.reverse();
              } else {
                _animeController.forward();
                showOptionMenu(
                  context,
                  listOptions: widget.optionList,
                  widgetKey: iconGlobalKey,
                  txtController: _textEditingController,
                  animationController: _animeController,
                );
              }
            },
            child: RotationTransition(
              turns: _animeController,
              child: Icon(
                _animeController.isCompleted
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
