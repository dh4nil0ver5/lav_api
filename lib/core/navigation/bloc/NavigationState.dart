part of 'NavigationBloc.dart';

abstract class NavigationStates extends Equatable {
  const NavigationStates();

  @override
  List<Object> get props => [];}

class HomeScreen extends NavigationStates { 
}

class SettingsScreen extends NavigationStates { 
}


class DrawerOpenState extends NavigationStates {
  bool isDrawerOpen;
  DrawerOpenState({required this.isDrawerOpen});
}

class DrawerClosedState extends NavigationStates { 
  bool isDrawerClose;
  DrawerClosedState({required this.isDrawerClose});
}
