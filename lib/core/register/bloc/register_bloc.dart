import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project/model/user_model.dart';
import 'package:project/service/service.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RestAPIService _service;
  RegisterBloc(this._service) : super(RegisterInitialState()) {
    // 
    on<AddUserEvent>((event, emit) async {
      emit(AddUserLoading(isLoading: true));
      await _service.addUserService(event.email, event.username).then((value) {
        emit(AddUserLoading(isLoading: false));
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pop(event.context);
        });
      }).onError((error, stackTrace) {
        emit(AddUserLoading(isLoading: false));
      });
    });
    // 
  }
}
