import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration_methods/core/utils/api_keys.dart';
import 'package:payment_integration_methods/core/utils/api_service.dart';
import 'package:payment_integration_methods/features/checkout/data/models/ephemeral_key_mpdel/ephemeral_key_mpdel.dart';
import 'package:payment_integration_methods/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:payment_integration_methods/features/checkout/data/models/payment_intent_input_model.dart';
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

  Future initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
      customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKeySecret,
      customerId: initPaymentSheetInputModel.customerId,
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

    var ephemeralKey = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      ephemeralKeySecret: ephemeralKey.secret!,
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
    );

    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
        body: {
          "customer": customerId,
        },
        contentType: Headers.formUrlEncodedContentType,
        url: "https://api.stripe.com/v1/ephemeral_keys",
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey} ',
          'Stripe-Version': '2024-06-20',
        });
    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKey;
  }
}
