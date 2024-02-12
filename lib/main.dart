import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/datatables/bloc/datatable_bloc.dart'; 
import 'package:project/core/navigation/bloc/NavigationBloc.dart';
import 'package:project/db_helper/cache_token.dart';
import 'package:project/service/auth_service.dart';
import 'package:project/service/service.dart';
import 'package:project/views/splashscreen/splashscreen.dart';

import 'core/auth/cubit/auth_cubit.dart';
import 'core/register/bloc/register_bloc.dart';

void main() {
  RestAPIService service = RestAPIService();
  AuthService authService = AuthService();
  CacheToken cacheToken = CacheToken();
  DrawerClosedState drawerClosedstate = DrawerClosedState(isDrawerClose: true);

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(authService, cacheToken)),
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(service)),
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()), 
        BlocProvider<DatatableBloc>(create: (context) => DatatableBloc(service)), 
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      )));
}
