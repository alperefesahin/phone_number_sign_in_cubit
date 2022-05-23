// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phone_number_sign_in/domain/auth/auth_failure.dart';
part 'phone_number_sign_in_cubit.freezed.dart';
part 'phone_number_sign_in_state.dart';

class PhoneNumberSignInCubit extends Cubit<PhoneNumberSignInState> {
  PhoneNumberSignInCubit() : super(PhoneNumberSignInState.initial());

  void phoneNumberChanged({required String phoneNumber}) {
    emit(state.copyWith(phoneNumber: phoneNumber));
  }

  void updateNextButtonStatus({required bool isPhoneNumberInputValidated}) {
    emit(state.copyWith(isPhoneNumberInputValidated: isPhoneNumberInputValidated));
  }
}
