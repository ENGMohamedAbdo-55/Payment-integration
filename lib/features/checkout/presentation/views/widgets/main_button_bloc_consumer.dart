import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration_methods/features/checkout/data/models/payment_itent_model/payment_intent_payment_model.dart';
import 'package:payment_integration_methods/features/checkout/presentation/manager/cubit/payment_cubit.dart';

import '../thanks_view.dart';
import 'main_button.dart';

class MainButtonBlocConsumer extends StatelessWidget {
  const MainButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ThankYouView()));
        }
        if (state is PaymentFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
          ));
        }
      },
      builder: (context, state) {
        return MainButton(
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
              amount: 100,
              currency: "USD",
            );
            BlocProvider.of<PaymentCubit>(context)
                .makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is PaymentLoading ? true : false,
          title: "Continue",
        );
      },
    );
  }
}
