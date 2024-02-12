import 'package:flutter/material.dart';
import 'package:project/views/chart/SubscriberSeries.dart';
import 'package:charts_flutter/flutter.dart' as charts; 
class SubscriberChart extends StatelessWidget {
  final List<SubscriberSeries> data;

  SubscriberChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (SubscriberSeries series, _) => series.brand,
          measureFn: (SubscriberSeries series, _) => series.volume,
          colorFn: (SubscriberSeries series, _) => series.barColor)
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Volume Sales By Brand",
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
