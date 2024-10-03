import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';

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
            style: context.textTheme.bodyMedium!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.model!.quantity!} pieces',
                style: context.textTheme.headlineSmall!.copyWith(
                  color: ColorsHelper.gray,
                ),
              ),
              Text(
                '\$ ${widget.model?.total}',
                style: context.textTheme.headlineSmall!.copyWith(
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
