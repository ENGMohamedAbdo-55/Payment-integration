import 'package:flutter/material.dart';
import 'package:payment_integration_methods/core/utils/styles.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_outlined,
            size: 35, color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/images/image.png",
            height: 500,
            width: 400,
          )
        ],
      ),
    );
  }
}
