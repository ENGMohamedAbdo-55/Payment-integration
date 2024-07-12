import 'package:flutter/material.dart';
import 'package:payment_integration_methods/features/checkout/presentation/views/my_cart_view.dart';

void main() {
  runApp(const PaymentIntegrationMethods());
}

class PaymentIntegrationMethods extends StatelessWidget {
  const PaymentIntegrationMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}
