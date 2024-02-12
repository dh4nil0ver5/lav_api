import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/snack_bar.dart';
import 'package:project/db_helper/cache_token.dart';
import 'package:project/service/auth_service.dart';
import 'package:project/views/landingpage_view.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;
  final CacheToken _cacheToken;

  AuthCubit(this._authService, this._cacheToken) : super(InitializeState());

  Future loginLogic(String email, String password, BuildContext context) async {
    emit(LoginLoadingState(isLoading: true));
    final Map<String, dynamic> data = {'email': email, 'password': password};
    await _authService.loginService(data).then((value) {
      emit(LoginLoadingState(isLoading: false));
      _cacheToken.writeToken(value.token);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const LandingPage(isLoading: false)),
        (route) => false,
      );
      snackBar(context, "Login successfully!");
      resetState();
    }).onError((error, stackTrace) {
      emit(LoginLoadingState(isLoading: false));
      snackBar(context, "Login failed");
    });
  } 
  
  void resetState() {
    emit(AuthStateReset());
  } 

}
