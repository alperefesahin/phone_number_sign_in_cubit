import 'package:dartz/dartz.dart';
import 'package:phone_number_sign_in/domain/auth/auth_failure.dart';
import 'package:phone_number_sign_in/domain/auth/auth_user_model.dart';

abstract class IAuthService {
  Stream<AuthUserModel> get authStateChanges;
  Future<void> signOut();
  Stream<Either<AuthFailure, String>> signInWithPhoneNumber({
    required String phoneNumber,
    required Duration timeout,
  });
  Future<Either<AuthFailure, Unit>> verifySmsCode({
    required String smsCode,
    required String verificationId,
  });
}
