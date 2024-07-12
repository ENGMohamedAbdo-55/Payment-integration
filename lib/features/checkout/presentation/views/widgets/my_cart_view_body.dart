import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'cart_info_item.dart';
import 'total_price_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Image.asset(
            "assets/images/image.png",
            height: 420,
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
        ],
      ),
    );
  }
}
