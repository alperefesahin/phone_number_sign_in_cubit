// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:phone_number_sign_in/domain/auth/auth_failure.dart';
import 'package:phone_number_sign_in/domain/auth/i_auth_service.dart';
import 'package:phone_number_sign_in/injection.dart';
part 'phone_number_sign_in_cubit.freezed.dart';
part 'phone_number_sign_in_state.dart';

@Injectable()
class PhoneNumberSignInCubit extends Cubit<PhoneNumberSignInState> {
  StreamSubscription<Either<AuthFailure, String>>? _phoneNumberSignInSubscription;
  late final IAuthService _authService;
  final Duration verificationCodeTimeout = const Duration(seconds: 60);

  PhoneNumberSignInCubit() : super(PhoneNumberSignInState.empty()) {
    _authService = getIt<IAuthService>();
  }
  void phoneNumberChanged({required String phoneNumber}) {
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
      ),
    );
  }

  void updateNextButtonStatus({
    required bool isPhoneNumberInputValidated,
  }) {
    emit(
      state.copyWith(
        isPhoneNumberInputValidated: isPhoneNumberInputValidated,
      ),
    );
  }

  void smsCodeChanged({
    required String smsCode,
  }) {
    emit(
      state.copyWith(
        smsCode: smsCode,
      ),
    );
  }

  void reset() {
    emit(
      state.copyWith(
        failureMessageOption: none(),
        verificationIdOption: none(),
        phoneNumber: "",
        smsCode: "",
        isInProgress: false,
        isPhoneNumberInputValidated: false,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _phoneNumberSignInSubscription?.cancel();
    return super.close();
  }

  void verifySmsCode() {
    state.verificationIdOption.fold(
      () {
        //Verification id does not exist. This should not happen.
      },
      (String verificationId) async {
        emit(
          state.copyWith(
            isInProgress: true,
            failureMessageOption: none(),
          ),
        );
        final Either<AuthFailure, Unit> failureOrSuccess =
            await _authService.verifySmsCode(smsCode: state.smsCode, verificationId: verificationId);
        failureOrSuccess.fold(
          (AuthFailure failure) {
            emit(
              state.copyWith(
                failureMessageOption: some(failure),
                isInProgress: false,
              ),
            );
          },
          (Unit _) {
            emit(
              state.copyWith(
                isInProgress: false,
              ),
            );
          },
        );
      },
    );
  }

  void signInWithPhoneNumber() {
    emit(
      state.copyWith(
        isInProgress: true,
        failureMessageOption: none(),
      ),
    );

    _phoneNumberSignInSubscription = _authService
        .signInWithPhoneNumber(
          phoneNumber: state.phoneNumber,
          timeout: verificationCodeTimeout,
        )
        .listen(
          (Either<AuthFailure, String> failureOrVerificationId) => failureOrVerificationId.fold(
            (AuthFailure failure) {
              emit(
                state.copyWith(
                  failureMessageOption: some(failure),
                  isInProgress: false,
                ),
              );
            },
            (String verificationId) {
              emit(
                state.copyWith(
                  verificationIdOption: some(verificationId),
                  isInProgress: false,
                ),
              );
            },
          ),
        );
  }
}
