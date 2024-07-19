import 'package:dartz/dartz.dart';
import 'package:payment_integration_methods/features/checkout/data/models/payment_itent_model/payment_intent_payment_model.dart';

import '../../../../core/utils/errors/failure.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}

