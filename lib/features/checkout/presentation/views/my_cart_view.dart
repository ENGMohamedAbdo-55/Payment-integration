import 'package:flutter/material.dart';
import 'package:payment_integration_methods/core/utils/styles.dart';

import 'widgets/build_appbar.dart';
import 'widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BuildAppbar(title: "My Cart"),  
        body: const MyCartViewBody());
  }

}