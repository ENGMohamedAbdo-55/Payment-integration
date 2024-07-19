import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration_methods/core/utils/api_keys.dart';
import 'package:payment_integration_methods/core/utils/api_service.dart';
import 'package:payment_integration_methods/features/checkout/data/models/payment_itent_model/payment_intent_payment_model.dart';
import 'package:payment_integration_methods/features/checkout/data/models/payment_itent_model/payment_itent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
   await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      merchantDisplayName: "Eng.Mohamed Abdo",
    ));
  }

  Future displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      print("payment done");
    } on Exception catch (e) {
      print("displayPaymentSheet error ${e.toString()}");
    }
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel,
    );

    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
  