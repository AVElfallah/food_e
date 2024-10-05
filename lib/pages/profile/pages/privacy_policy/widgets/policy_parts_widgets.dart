import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';

class PolicyPartsWidgets extends StatefulWidget {
  const PolicyPartsWidgets._({
    super.key,
    this.title,
    this.description,
    this.subTitles,
    this.titleIndex,
  });
  final String? title;
  final String? description;
  final int? titleIndex;
  final List<Map<String, String>>? subTitles;

  factory PolicyPartsWidgets({
    Key? key,
    String? title,
    String? description,
    int? titleIndex = 1,
    List<Map<String, String>>? subTitles,
  }) {
    return PolicyPartsWidgets._(
      key: key,
      title: title,
      description: description,
      subTitles: subTitles,
      titleIndex: titleIndex,
    );
  }

  @override
  State<PolicyPartsWidgets> createState() => _PolicyPartsWidgetsState();
}

class _PolicyPartsWidgetsState extends State<PolicyPartsWidgets> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.titleIndex}- ${widget.title}',
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
            '${widget.titleIndex}.${i + 1}-${widget.subTitles![i]['title']}',
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
