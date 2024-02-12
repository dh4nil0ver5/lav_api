part of 'NavigationBloc.dart';

abstract class NavigationEvents extends Equatable {  
  const NavigationEvents();

  @override
  List<Object> get props => [];
}

class GoToHomeScreenEvent extends NavigationEvents { 
}

class OpenSettingsEvent extends NavigationEvents { 
}
 
class OpenDrawerEvent extends NavigationEvents { 
}

class CloseDrawerEvent extends NavigationEvents { 
}
