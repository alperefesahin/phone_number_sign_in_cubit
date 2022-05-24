import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phone_number_sign_in/domain/auth/auth_failure.dart';
part 'phone_number_sign_in_cubit.freezed.dart';
part 'phone_number_sign_in_state.dart';

class PhoneNumberSignInCubit extends Cubit<PhoneNumberSignInState> {
  PhoneNumberSignInCubit() : super(PhoneNumberSignInState.initial()) {
    _phoneNumberSignInSubscription = streamController.stream.listen((event) {
      event.fold((AuthFailure authFailure) {
        emit(state.copyWith(failureOption: some(authFailure)));
      }, (r) {});
    });
  }

  final _authService = FirebaseAuth.instance;
  late StreamSubscription<Either<AuthFailure, String>>? _phoneNumberSignInSubscription;
  final StreamController<Either<AuthFailure, String>> streamController = StreamController<Either<AuthFailure, String>>();

  @override
  Future<void> close() async {
    await _phoneNumberSignInSubscription?.cancel();

    return super.close();
  }

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
        failureOption: none(),
        verificationIdOption: none(),
        isInProgress: false,
      ),
    );
  }

  void signInWithPhoneNumber() {
    emit(state.copyWith(isInProgress: true));

    _authService.verifyPhoneNumber(
      phoneNumber: state.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        //! Android Only!!!
        await _authService.signInWithCredential(credential);
      },
      codeSent: (String verificationId, int? resendToken) async {
        final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: state.smsCode,
        );
        await _authService.signInWithCredential(credential);

        streamController.add(right(verificationId));

        emit(state.copyWith(isInProgress: false));
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e);
        late final Either<AuthFailure, String> result;

        if (e.code == 'invalid-phone-number') {
          result = left(const AuthFailure.invalidPhoneNumber());
        } else if (e.code == 'too-many-requests') {
          result = left(const AuthFailure.tooManyRequests());
        } else if (e.code == 'app-not-authorized') {
          result = left(const AuthFailure.deviceNotSupported());
        } else {
          result = left(const AuthFailure.serverError());
        }
        streamController.add(result);
        emit(state.copyWith(isInProgress: false));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        streamController.add(left(const AuthFailure.smsTimeout()));
        emit(state.copyWith(isInProgress: false));
      },
    );
  }
}
