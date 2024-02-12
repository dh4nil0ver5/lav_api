import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'NavigationEvent.dart';
part 'NavigationState.dart';

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> { 
  NavigationBloc() : super(DrawerClosedState(isDrawerClose: true)) {
    on<GoToHomeScreenEvent>((event, emit) => emit(HomeScreen()));
    on<OpenSettingsEvent>((event, emit) => emit(SettingsScreen())); 
    on<OpenDrawerEvent>((event, emit) => emit(DrawerOpenState(isDrawerOpen: true)));
    on<CloseDrawerEvent>((event, emit) => emit(DrawerClosedState(isDrawerClose: true)));
  } 
}
