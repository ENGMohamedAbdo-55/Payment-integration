import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.isActive = false,
    required this.image,
  });
  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              width: 1.50,
              color: isActive ? const Color(0xFF34A853) : Colors.grey,
            ),
          ),
          shadows: [
            BoxShadow(
              color: isActive ? const Color(0xFF34A853) : Colors.white,
              offset: const Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ]),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Image.asset(
          image,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
