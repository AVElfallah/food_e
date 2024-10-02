import 'package:flutter/material.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/model/order_history_model.dart';
import 'package:food_e/pages/profile/pages/order_history/widgets/order_history_details_item.dart';
import 'package:food_e/shared/widgets/role_model_appbar_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class OrderDetailsLayouts extends StatelessWidget {
  const OrderDetailsLayouts({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderHistoryModel args =
        ModalRoute.of(context)?.settings.arguments as OrderHistoryModel;
    String? formattedDate = DateFormat('dd MMMM yyyy').format(args.orderDate!);

    return Scaffold(
      appBar: RoleModelAppbarWidget(
        context,
        leadingIcon: Icons.arrow_back_ios_new,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedDate.toString(),
              style: GoogleFonts.bebasNeue(
                fontSize: 36,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '\$ ${args.totalPrice}',
              style: GoogleFonts.bebasNeue(
                fontSize: 24,
                color: ColorsHelper.primary,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            for (var i = 0; i < args.items!.length; i++) ...[
              OrderHistoryDetailsItem(
                model: args.items![i],
              ),
              const SizedBox(
                height: 40,
              )
            ]
          ],
        ),
      ),
    );
  }
}
