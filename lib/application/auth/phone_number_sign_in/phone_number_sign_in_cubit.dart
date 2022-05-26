import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phone_number_sign_in/domain/auth/auth_failure.dart';
part 'phone_number_sign_in_cubit.freezed.dart';
part 'phone_number_sign_in_state.dart';

class PhoneNumberSignInCubit extends Cubit<PhoneNumberSignInState> {
  PhoneNumberSignInCubit() : super(PhoneNumberSignInState.initial());

  final _authService = FirebaseAuth.instance;

  void phoneNumberChanged({required String phoneNumber}) {
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
      ),
    );
  }

  void updateNextButtonStatus({required bool isPhoneNumberInputValidated}) {
    emit(
      state.copyWith(
        isPhoneNumberInputValidated: isPhoneNumberInputValidated,
      ),
    );
  }

  void smsCodeChanged({required String smsCode}) {
    emit(
      state.copyWith(
        smsCode: smsCode,
      ),
    );
  }

  void reset() {
    emit(
      state.copyWith(
        failureMessage: null,
        verificationId: "",
        isInProgress: false,
        isPhoneNumberInputValidated: false,
      ),
    );
  }

  Future verifySmsCode() async {
    try {
      emit(state.copyWith(isInProgress: true));
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: state.verificationId,
        smsCode: state.smsCode,
      );
      await _authService.signInWithCredential(credential).then(
            (value) => emit(
              state.copyWith(
                isInProgress: false,
              ),
            ),
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == "session-expired") {
        emit(
          state.copyWith(
            failureMessage: const AuthFailure.sessionExpired(),
            isInProgress: false,
          ),
        );
      } else if (e.code == "ınvalıd-verıfıcatıon-code" || e.code == "invalid-verification-code") {
        emit(
          state.copyWith(
            failureMessage: const AuthFailure.invalidVerificationCode(),
            isInProgress: false,
          ),
        );
      }
    }
  }

  void signInWithPhoneNumber({required String phoneNumber}) {
    emit(state.copyWith(isInProgress: true));
    _authService.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        //! Android Only!!!
        await _authService.signInWithCredential(credential);
      },
      codeSent: (String verificationId, int? resendToken) async {
        emit(state.copyWith(
          verificationId: verificationId,
          isInProgress: false,
        ));
      },
      verificationFailed: (FirebaseAuthException e) {
        late final AuthFailure result;
        if (e.code == 'too-many-requests') {
          result = const AuthFailure.tooManyRequests();
        } else if (e.code == 'app-not-authorized') {
          result = const AuthFailure.deviceNotSupported();
        } else {
          result = const AuthFailure.serverError();
        }

        emit(state.copyWith(failureMessage: result, isInProgress: false));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        emit(state.copyWith(
          failureMessage: const AuthFailure.smsTimeout(),
          isInProgress: false,
        ));
      },
    );
  }
}
