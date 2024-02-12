part of 'datatable_bloc.dart';
 

abstract class DatatableState {}

class LogicInitializeState extends DatatableState {} 
 
class LogicLoadingState extends DatatableState {}

class ReadUserState extends DatatableState {
  final SalesModel userModel;
  ReadUserState({required this.userModel});
}

class LogicErrorState extends DatatableState {
  final String error;
  LogicErrorState({required this.error});
}
