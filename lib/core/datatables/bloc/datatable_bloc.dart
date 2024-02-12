import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project/model/SalesModel.dart';
import 'package:project/service/service.dart';

part 'datatable_event.dart';
part 'datatable_state.dart';

class DatatableBloc extends Bloc<DatatableEvent, DatatableState> {
  final RestAPIService _service;
  DatatableBloc(this._service) : super(LogicLoadingState()) {  
    on<ReadUserEvent>((event, emit) async {
      emit(LogicLoadingState());
      await _service.readSalesReport().then((value) {  
        emit(ReadUserState(userModel: value));
      }).onError((error, stackTrace) {
        emit(LogicErrorState(error: error.toString()));
      });
    }); 
  }
}