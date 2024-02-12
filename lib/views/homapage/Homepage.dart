import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/datatables/bloc/datatable_bloc.dart';
import 'package:project/model/SalesModel.dart'; 
import 'package:http/http.dart' as http;
import 'package:project/views/homapage/DetailTable.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {   

  @override
  void initState() { 
    super.initState();  
    
    Future.delayed(Duration.zero, () {
      BlocProvider.of<DatatableBloc>(context).add(ReadUserEvent());
    });
    setState(() {});
  }
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatatableBloc, DatatableState>(
      builder: (context, state){   
        if(state is LogicLoadingState){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                CircularProgressIndicator(),
                Text("Loading")
              ],
            ),);
        } else if (state is ReadUserState) {   
          return DetailTable(detailSales: state.userModel.data);
        }  
        return Center(child: const Text("Something went wrong !"));
      },
    );  
  }  
}