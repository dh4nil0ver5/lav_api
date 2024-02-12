import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SubscriberSeries {
  final String brand;
  final int volume;
  final charts.Color barColor;

  SubscriberSeries({required String this.brand, required this.volume, required this.barColor});
}
