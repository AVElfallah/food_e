import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/model/order_history_model.dart';
import 'package:food_e/pages/profile/pages/order_history/layouts/order_details_layouts.dart';
import 'package:intl/intl.dart';

import '../../../../../shared/constants/constant_sizedboxes.dart';

class OrderHistoryItemWidget extends StatelessWidget {
  const OrderHistoryItemWidget({
    super.key,
    this.model,
  });
  final OrderHistoryModel? model;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    String? formattedDate =
        DateFormat('dd MMMM yyyy').format(model!.orderDate!);
    return SizedBox(
      height: height * .2,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Order Date [START]
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formattedDate,
                style: context.textTheme.labelSmall!.copyWith(
                  color: ColorsHelper.secondary,
                ),
              ),
              //Price [START]
              Text(
                '\$${model!.totalPrice!}',
                style: context.textTheme.labelSmall!.copyWith(
                  color: ColorsHelper.secondary,
                ),
              ),
            ],
          ),
          h10SizedBox,

          //Quantity [START]
          Text(
            '${model!.itemsQuantity!} items',
            style: context.textTheme.labelMedium!.copyWith(
              color: ColorsHelper.gray,
            ),
          ),

          h20SizedBox,
          if (!model!
              .isArrived!) // if the order did not arrived this button is shown
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'TRACK ORDER',
              ),
            )
          else // else if order was arrived this button will be shown
            OutlinedButton(
              onPressed: () {
                // TODO: navigate to order details Layout

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const OrderDetailsLayouts(),
                    settings: RouteSettings(arguments: model),
                  ),
                );
              },
              child: const Text(
                'VIEW DETAILS',
              ),
            )
        ],
      ),
    );
  }
}
