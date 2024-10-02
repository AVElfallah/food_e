import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../helpers/colors_helper.dart';
import '../../../../../model/order_history_model.dart';

class OrderHistoryDetailsItem extends StatefulWidget {
  const OrderHistoryDetailsItem({super.key, this.model});
  final OrderHistoryMealItem? model;

  @override
  State<OrderHistoryDetailsItem> createState() =>
      _OrderHistoryDetailsItemState();
}

class _OrderHistoryDetailsItemState extends State<OrderHistoryDetailsItem> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * .065,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            (widget.model?.mealName!) ?? '',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.model!.quantity!} pieces',
                style: GoogleFonts.bebasNeue(
                  fontSize: 18,
                  color: ColorsHelper.gray,
                ),
              ),
              Text(
                '\$ ${widget.model?.total}',
                style: GoogleFonts.bebasNeue(
                  fontSize: 18,
                  color: ColorsHelper.gray,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
