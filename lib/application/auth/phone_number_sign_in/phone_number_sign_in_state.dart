part of 'phone_number_sign_in_cubit.dart';

@freezed
class PhoneNumberSignInState with _$PhoneNumberSignInState {
  const factory PhoneNumberSignInState({
    required String phoneNumber,
    required String smsCode,
    required Option<AuthFailure> failureOption,
    required Option<String> verificationIdOption,
    required bool isInProgress,
  }) = _PhoneNumberSignInState;
  const PhoneNumberSignInState._();

  factory PhoneNumberSignInState.initial() => PhoneNumberSignInState(
        phoneNumber: "",
        smsCode: "",
        failureOption: none(),
        verificationIdOption: none(),
        isInProgress: false,
      );
  bool get displayNextButton => verificationIdOption.isNone() && !isInProgress;
  bool get displaySmsCodeForm => verificationIdOption.isSome();
  bool get displayLoadingIndicator => !displayNextButton && !displaySmsCodeForm;
}
