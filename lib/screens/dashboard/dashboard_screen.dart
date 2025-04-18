import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/providers/dashboard_provider.dart';
import 'package:pulseboard/widgets/app_bar_action_icon.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/sensor_data.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final getDashboardDataFromProvider = ref.watch(getDashboardDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sensor Overview"),
        actions: [
          AppBarActionIcon(icon: Icons.settings, onPressed: () {}),
          AppBarActionIcon(icon: Icons.details, onPressed: () {}),
        ],
      ),
      body: Column(children: [
        SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              minimum: getMinimumTemperature(ref),
              maximum: getMaximumTemperature(ref),),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<SensorData, String>>[
              BubbleSeries<SensorData, String>(
                  dataSource: getDashboardDataFromProvider.sensorReadings,
                  xValueMapper: (SensorData data, _) => data.status,
                  yValueMapper: (SensorData data, _) => data.temperature,
                  name: 'Temperature',
                  pointColorMapper: (SensorData data, _) {
                    switch (data.status) {
                      case 'cool':
                        return Colors.lightBlue;
                      case 'mild':
                        return Colors.blue;
                      case 'warm':
                        return Colors.orange;
                      case 'hot':
                        return Colors.red;

                      default:
                        return Colors.grey;
                    }
                  })
            ])
      ],),
    );
  }
}
