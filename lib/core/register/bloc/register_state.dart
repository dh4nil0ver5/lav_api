part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => [];
} 

class RegisterInitialState extends RegisterState {}
 
class LogicLoadingState extends RegisterState {}

class ReadUserState extends RegisterState {
  final UserModel userModel;
  ReadUserState({required this.userModel});
}

class AddUserLoading extends RegisterState {
  bool isLoading;
  AddUserLoading({required this.isLoading});
}

class DeleteUserLoading extends RegisterState {
  bool isLoading;
  DeleteUserLoading({required this.isLoading});
}

class LogicErrorState extends RegisterState {
  final String error;
  LogicErrorState({required this.error});
}
