import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phone_number_sign_in/domain/auth/auth_user_model.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final _authService = FirebaseAuth.instance;
  late StreamSubscription? _authUserSubscription;

  AuthCubit() : super(AuthState.empty()) {
    _authUserSubscription = _authService.authStateChanges().listen(_listenAuthStateChangesStream);
  }

  @override
  Future<void> close() async {
    await _authUserSubscription?.cancel();
    super.close();
  }

  Future<void> _listenAuthStateChangesStream(User? authUser) async {
    emit(
      state.copyWith(
        userModel: AuthUserModel(id: authUser!.uid, phoneNumber: authUser.phoneNumber!),
        isUserCheckedFromAuthService: true,
      ),
    );
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
