import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration_methods/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment_integration_methods/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import '../payment_details.dart';
import '../thanks_view.dart';
import 'payment_methods_bottom_sheet.dart';
import 'payment_methods_list_view.dart';

import '../../../../../core/utils/styles.dart';
import 'cart_info_item.dart';
import 'main_button.dart';
import 'total_price_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/image.png",
              height: 420,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: "Order Subtotal",
            value: r"$42.97 ",
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: "Discount",
            value: r"$0",
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: "Shipping",
            value: r"$8",
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Color(0xffc7c7c7),
            height: 20,
            thickness: 2,
          ),
          const TotalPrice(
            title: "Total",
            value: r"$50.97",
          ),
          const SizedBox(
            height: 20,
          ),
          MainButton(
            title: "Complete Payment",
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImpl()),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
