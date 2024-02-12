import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:project/core/datatables/bloc/datatable_bloc.dart';
import 'package:project/model/SalesModel.dart';
import 'package:project/views/chart/SubscriberSeries.dart';
import 'package:project/views/chart/subscriber_chart.dart';
 
class DetailChartSales extends StatelessWidget{
  final List<Sales> detailSales;

  DetailChartSales({Key? key, required this.detailSales}) : super(key: key);

  List<SubscriberSeries> transformData() {
    Map<String, int> groupedData = {};
    for (Sales sale in detailSales) {
      groupedData[sale.brand] = (groupedData[sale.brand] ?? 0) + sale.volume;
    }
    print(groupedData.toString());
    return groupedData.keys.map((brand) => SubscriberSeries(
      brand: brand,
      volume: groupedData[brand]!,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    )).toList();
  }



  @override
  Widget build(BuildContext context) {
    final List<SubscriberSeries> data = transformData(); // Call the method
  
    return Scaffold(
      body: Center(
        child: SubscriberChart(
          data: data,
        )
      ),
    );
  }
} 