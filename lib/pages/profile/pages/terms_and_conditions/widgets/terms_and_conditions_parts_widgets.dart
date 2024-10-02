import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    print(currentIndex);
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
