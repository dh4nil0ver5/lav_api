import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/datatables/bloc/datatable_bloc.dart';
import 'package:project/views/chart/DetailChartSales.dart';  

class ChartSales extends StatefulWidget {
  const ChartSales({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChartSalesState createState() => _ChartSalesState();
}

class _ChartSalesState extends State<ChartSales> {
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
      builder: (context, state) {
        if (state is LogicLoadingState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [CircularProgressIndicator(), Text("Loading")],
            ),
          );
        } else if (state is ReadUserState) {
          return DetailChartSales(detailSales: state.userModel.data);
        }
        return const Center(child: Text("Something went wrong !"));
      },
    );
  }
}
