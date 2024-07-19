import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_integration_methods/features/checkout/data/repos/checkout_repo.dart';

import '../../../data/models/payment_itent_model/payment_intent_payment_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    final result = await checkoutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    result.fold((l) {
      emit(PaymentFailure(l.errMessage));
    }, (r) {
      emit(PaymentSuccess());
    });
    @override
    void onChange(Change<PaymentState> change) {
      log(change.toString());
      super.onChange(change);
    }
  }
}
