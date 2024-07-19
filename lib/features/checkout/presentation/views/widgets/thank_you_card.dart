import 'package:flutter/material.dart';
import 'total_price_item.dart';

import '../../../../../core/utils/styles.dart';
import 'card_info_widget.dart';
import 'payment_item_info.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.only(
            top: 66,
            left: 22,
            right: 22,
          ),
          child: Column(
            children: [
              const Text(
                "Thank you",
                style: Styles.style25,
              ),
              Text(
                "Your transaction was successful",
                textAlign: TextAlign.center,
                style: Styles.style20,
              ),
              const SizedBox(
                height: 42,
              ),
              const PaymentItemInfo(
                title: "Date",
                value: "01/11/2032",
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentItemInfo(
                title: "time",
                value: "10:30",
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentItemInfo(
                title: "To",
                value: "John",
              ),
              const Divider(
                height: 60,
                thickness: 2,
              ),
              const TotalPrice(title: "Total", value: r"$42.97"),
              const SizedBox(
                height: 50,
              ),
              const CardInfoWidget(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/Vector.png"),
                  Container(
                    width: 113,
                    height: 58,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          width: 1.50,
                          color: Color(0xFF34A853),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "PAID",
                        textAlign: TextAlign.center,
                        style: Styles.style24
                            .copyWith(color: const Color(0xFF34A853)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height:
                    ((MediaQuery.sizeOf(context).height * 0.2 + 20) / 2) - 29,
              )
            ],
          )),
    );
  }
}
