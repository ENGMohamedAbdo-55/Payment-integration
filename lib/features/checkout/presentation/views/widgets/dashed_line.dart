import 'package:flutter/material.dart';

class DashedLineSeperater extends StatelessWidget {
  const DashedLineSeperater({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        25,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              height: 3,
              // width: 3,
              color: const Color(0xFFB8B8B8),
            ),
          ),
        ),
      ),
    );
  }
}
