import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_integration_methods/core/utils/api_keys.dart';
import 'package:payment_integration_methods/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment_integration_methods/features/checkout/data/models/amount_model/details.dart';
import 'package:payment_integration_methods/features/checkout/data/models/item_list_model/item.dart';
import 'package:payment_integration_methods/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:payment_integration_methods/features/checkout/data/models/payment_intent_input_model.dart';
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
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //   customerId: "cus_QVBC2wPQjZKUKg",
            //   amount: 100,
            //   currency: "USD",
            // );
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);

            var transactionData = getTransactionData();
            exceutePaypalPayment(context, transactionData);
          },
          isLoading: state is PaymentLoading ? true : false,
          title: "Continue",
        );
      },
    );
  }

  void exceutePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId:ApiKeys.paypalClientId ,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionData() {
    var amount = AmountModel(
        total: "100",
        currency: "USD",
        details: Details(shipping: "0", shippingDiscount: 0, subtotal: "100"));

    List<orderItem> orders = [
      orderItem(
        currency: "USD",
        name: "Apple",
        price: "4",
        quantity: 10,
      ),
      orderItem(
        currency: "USD",
        name: "Apple",
        price: "5",
        quantity: 12,
      )
    ];
    var itemList = ItemListModel(items: orders);
    return (amount: amount, itemList: itemList);
  }
}
