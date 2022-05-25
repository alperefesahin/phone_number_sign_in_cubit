part of 'phone_number_sign_in_cubit.dart';

@freezed
class PhoneNumberSignInState with _$PhoneNumberSignInState {
  const factory PhoneNumberSignInState({
    required String phoneNumber,
    required String smsCode,
    required String verificationId,
    required bool isInProgress,
    required bool isPhoneNumberInputValidated,
    AuthFailure? failureMessage,
  }) = _PhoneNumberSignInState;
  const PhoneNumberSignInState._();

  factory PhoneNumberSignInState.initial() => const PhoneNumberSignInState(
        phoneNumber: "",
        smsCode: "",
        verificationId: "",
        isInProgress: false,
        isPhoneNumberInputValidated: false,
      );
}
