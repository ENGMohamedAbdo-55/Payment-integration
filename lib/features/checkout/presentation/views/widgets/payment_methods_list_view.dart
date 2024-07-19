import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethods = const [
    "assets/images/card.png",
    "assets/images/paypal.png",
    "assets/images/th.jfif",
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          itemCount: paymentMethods.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GestureDetector(
                onTap: () {
                  selectedIndex = index;
                  setState(() {});
                },
                child: PaymentMethodItem(
                  isActive: selectedIndex == index,
                  image: paymentMethods[index],
                ),
              ),
            );
          }),
    );
  }
}
