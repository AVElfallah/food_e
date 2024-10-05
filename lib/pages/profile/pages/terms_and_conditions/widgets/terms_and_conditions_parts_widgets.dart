import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';

import '../../../../../helpers/colors_helper.dart';

class TermsAndConditionsPartsWidgets extends StatefulWidget {
  const TermsAndConditionsPartsWidgets._({
    super.key,
    this.title,
    this.description,
    this.subTitles,
  });
  final String? title;
  final String? description;
  final List<Map<String, String>>? subTitles;
  static int counter = 0;

  factory TermsAndConditionsPartsWidgets({
    Key? key,
    String? title,
    String? description,
    List<Map<String, String>>? subTitles,
  }) {
    counter += 1;
    return TermsAndConditionsPartsWidgets._(
      key: key,
      title: title,
      description: description,
      subTitles: subTitles,
    );
  }

  @override
  State<TermsAndConditionsPartsWidgets> createState() =>
      _TermsAndConditionsPartsWidgetsState();
}

class _TermsAndConditionsPartsWidgetsState
    extends State<TermsAndConditionsPartsWidgets> {
  late final int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = TermsAndConditionsPartsWidgets.counter;
  }

  @override
  void dispose() {
    super.dispose();
    TermsAndConditionsPartsWidgets.counter--;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$currentIndex- ${widget.title}',
          style: context.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.description!,
          style: context.textTheme.bodyMedium?.copyWith(
            color: ColorsHelper.gray,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        for (var i = 0; i < widget.subTitles!.length; i++) ...[
          Text(
            '$currentIndex.${i + 1}-${widget.subTitles![i]['title']}',
            style: context.textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${widget.subTitles![i]['description']}',
            style: context.textTheme.bodyMedium?.copyWith(
              color: ColorsHelper.gray,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ]
      ],
    );
  }
}
