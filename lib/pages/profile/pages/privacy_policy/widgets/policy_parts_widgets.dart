import 'package:flutter/material.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class PolicyPartsWidgets extends StatefulWidget {
  const PolicyPartsWidgets._({
    super.key,
    this.title,
    this.description,
    this.subTitles,
  });
  final String? title;
  final String? description;
  final List<Map<String, String>>? subTitles;
  static int counter = 0;

  factory PolicyPartsWidgets({
    Key? key,
    String? title,
    String? description,
    List<Map<String, String>>? subTitles,
  }) {
    counter += 1;
    return PolicyPartsWidgets._(
      key: key,
      title: title,
      description: description,
      subTitles: subTitles,
    );
  }

  @override
  State<PolicyPartsWidgets> createState() => _PolicyPartsWidgetsState();
}

class _PolicyPartsWidgetsState extends State<PolicyPartsWidgets> {
  late final int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = PolicyPartsWidgets.counter;
    print(currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
    PolicyPartsWidgets.counter--;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${currentIndex}- ${widget.title}',
          style: GoogleFonts.bebasNeue(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.description!,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: ColorsHelper.gray,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        for (var i = 0; i < widget.subTitles!.length; i++) ...[
          Text(
            '$currentIndex.${i + 1}-${widget.subTitles![i]['title']}',
            style: GoogleFonts.bebasNeue(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${widget.subTitles![i]['description']}',
            style: GoogleFonts.poppins(
              fontSize: 14,
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
