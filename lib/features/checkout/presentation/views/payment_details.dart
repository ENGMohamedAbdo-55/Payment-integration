import 'package:flutter/material.dart';

import 'widgets/build_appbar.dart';
import 'widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppbar(
        title: "Payment Details",
      ),
      body: const PaymentDetailsViewBody(),
    );
  }
}
