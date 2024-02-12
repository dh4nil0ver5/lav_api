import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/db_helper/cache_token.dart'; 
import 'package:project/model/user_model.dart';
import 'package:project/views/chart/ChartSales.dart';
import 'package:project/views/chart/DetailChartSales.dart';
import 'package:project/views/homapage/Homepage.dart'; 

import '../core/navigation/bloc/NavigationBloc.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, required this.isLoading});

  final bool isLoading;
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final CacheToken _cacheToken = CacheToken();
  
  @override
  void initState() {
    // context.read<LogicalService>().add(ReadUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: 
          BlocBuilder<NavigationBloc, NavigationStates>(
          builder: (context, state) {
          if (state is HomeScreen) {
            return Text("Sales report");
          } else if (state is SettingsScreen) {
            return Text("Chart");
          }  
            return Text("Test App");
          }),
        // const Text("Test App"),
        actions: [
        IconButton(
          onPressed: (){
            _cacheToken.delelteAll(context);
          },
          icon: const Icon(Icons.logout)
        )
        ],
      ), 
      drawer: buildDrawer(context),
      body: _buildBody, 
    );
  }
  
  Widget get _buildBody {
    return BlocBuilder<NavigationBloc, NavigationStates>(
          builder: (context, state) {
            if (state is HomeScreen) {
              return Homepage();
            } else if (state is SettingsScreen) {
              return ChartSales(); 
            }  
            return Center(
              child: Container(
                child: const Text("Welcome",
                  style: TextStyle(
                    fontSize: 22
                  ),),
              ),
            );
          },
        );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('App Name'),
          ),
          ListTile(
            title: const Text('Saler'),
            onTap: () =>
                context.read<NavigationBloc>().add(GoToHomeScreenEvent()),
          ),
          ListTile(
            title: const Text('Chart Seller'),
            onTap: () =>
                context.read<NavigationBloc>().add(OpenSettingsEvent()),
          ), 
        ],
      ),
    );
  }
}