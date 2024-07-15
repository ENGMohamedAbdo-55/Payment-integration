import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      width: 305,
      height: 73,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png"),
          const SizedBox(
            width: 23,
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Credit Card\n",
                  style: Styles.style18Bold,
                ),
                TextSpan(
                  text: "Master **78",
                  style: Styles.style18,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
