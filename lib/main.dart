import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration_methods/core/utils/api_keys.dart';
import 'features/checkout/presentation/views/my_cart_view.dart';

void main() {
  Stripe.publishableKey=ApiKeys.publishableKey;
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

//? paymentIntentObject  create  payment intent (amount, currency)
//? initialize payment sheet (paymentIntentClientSecret)
//? present payment sheet

