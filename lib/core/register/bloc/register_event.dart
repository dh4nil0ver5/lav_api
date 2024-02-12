part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class ReadUserEvent extends RegisterEvent {}

class AddUserEvent extends RegisterEvent {
  final String username;
  final String email;
  final BuildContext context;
  AddUserEvent(
      {required this.username, required this.email, required this.context});
} 

class UpdateUserEvent extends RegisterEvent {
  final String id;
  final String username;
  final String email;
  final BuildContext context;
  UpdateUserEvent(this.context,
      {required this.id, required this.email, required this.username});
}
 
class DeleteUserEvent extends RegisterEvent {
  final String id;
  DeleteUserEvent({required this.id});
}
