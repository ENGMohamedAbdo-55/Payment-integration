import 'package:dartz/dartz.dart';

import 'package:payment_integration_methods/core/utils/errors/failure.dart';
import 'package:payment_integration_methods/core/utils/stripe_service.dart';

import 'package:payment_integration_methods/features/checkout/data/models/payment_intent_input_model.dart';

import 'checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
