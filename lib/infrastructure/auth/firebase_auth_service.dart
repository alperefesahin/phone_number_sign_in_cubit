import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:phone_number_sign_in/domain/auth/auth_failure.dart';
import 'package:phone_number_sign_in/domain/auth/auth_user_model.dart';
import 'package:phone_number_sign_in/domain/auth/i_auth_service.dart';

@LazySingleton(as: IAuthService)
class FirebaseAuthService implements IAuthService {
  FirebaseAuthService(this._firebaseAuth);
  final FirebaseAuth _firebaseAuth;

  @override
  Stream<AuthUserModel> get authStateChanges {
    return _firebaseAuth.authStateChanges().map(
      (User? user) {
        if (user == null) {
          return AuthUserModel.empty();
        } else {
          return AuthUserModel(id: user.uid, phoneNumber: user.phoneNumber!);
        }
      },
    );
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Stream<Either<AuthFailure, String>> signInWithPhoneNumber({
    required String phoneNumber,
    required Duration timeout,
  }) async* {
    final StreamController<Either<AuthFailure, String>> streamController =
        StreamController<Either<AuthFailure, String>>();

    await _firebaseAuth.verifyPhoneNumber(
        timeout: timeout,
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          //! Android Only!!!
          await _firebaseAuth.signInWithCredential(credential);
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Wait for the user to enter the SMS code
          streamController.add(right(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          streamController.add(left(const AuthFailure.smsTimeout()));
        },
        verificationFailed: (FirebaseAuthException e) {
          late final Either<AuthFailure, String> result;
          if (e.code == 'too-many-requests') {
            result = left(const AuthFailure.tooManyRequests());
          } else if (e.code == 'app-not-authorized') {
            result = left(const AuthFailure.deviceNotSupported());
          } else {
            result = left(const AuthFailure.serverError());
          }
          streamController.add(result);
        });

    yield* streamController.stream;
  }

  @override
  Future<Either<AuthFailure, Unit>> verifySmsCode({
    required String smsCode,
    required String verificationId,
  }) async {
    try {
      final PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "session-expired") {
        return left(const AuthFailure.sessionExpired());
      } else if (e.code == "ınvalıd-verıfıcatıon-code" || e.code == "invalid-verification-code") {
        return left(const AuthFailure.invalidVerificationCode());
      }
      return left(const AuthFailure.serverError());
    }
  }
}
