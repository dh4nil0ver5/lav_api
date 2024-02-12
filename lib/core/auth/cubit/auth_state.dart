part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState():super();

  @override
  List<Object> get props => [];

} 

class AuthStateReset extends AuthState {}

class InitializeState extends AuthState {}

class LoginLoadingState extends AuthState {
  bool isLoading;
  LoginLoadingState({required this.isLoading});
}

class SignUpLoadingState extends AuthState {
  bool isLoading;
  SignUpLoadingState({required this.isLoading});
}
