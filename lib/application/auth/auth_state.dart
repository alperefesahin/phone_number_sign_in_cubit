part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthUserModel userModel,
    required bool isUserCheckedFromAuthService,
  }) = _AuthState;
  const AuthState._();

  factory AuthState.empty() => AuthState(
        userModel: AuthUserModel.empty(),
        isUserCheckedFromAuthService: false,
      );

  bool get isLoggedIn => userModel != AuthUserModel.empty();
}