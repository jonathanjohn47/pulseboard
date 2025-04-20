import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/sensor_data.dart';
import '../providers/dashboard_provider.dart';

@RoutePage()
class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen({super.key});

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final getDashboardDataFromProvider = ref.watch(getDashboardDataProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Details"), automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Column(children: [
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                minimum:
                getMinimumTemperature(ref) - 1,

                maximum: getMaximumTemperature(ref) + 1,),
              tooltipBehavior: TooltipBehavior(enable: false),
              title: ChartTitle(
                  text: 'Temperature (°C)'),
              series: <CartesianSeries<SensorData, String>>[
                LineSeries<SensorData, String>(
                    dataSource: getDashboardDataFromProvider.sensorReadings,
                    xValueMapper: (SensorData data, _) => data.time,
                    yValueMapper: (SensorData data, _) =>
                    data.temperature,
                    //sizeValueMapper: (datum, num) => num * 2,
                    name: 'Temperature',

                    pointColorMapper: (SensorData data, _) {
                      return Colors.amber;
                    }),
              ]),
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                minimum:
                getMinimumHumidity(ref) - 5,
                maximum: getMaximumHumidity(ref) + 5,),
              tooltipBehavior: TooltipBehavior(enable: false),
              title: ChartTitle(
                  text: 'Humidity (%)'),
              series: <CartesianSeries<SensorData, String>>[
                BubbleSeries<SensorData, String>(
                    dataSource: getDashboardDataFromProvider.sensorReadings,
                    xValueMapper: (SensorData data, _) => data.status,
                    yValueMapper: (SensorData data, _) =>
                    data.humidity,
                    sizeValueMapper: (datum, num) => num * 0.5,
                    name: 'Humidity',
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
                    }),
              ]),
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                minimum:
                getMinimumPressure(ref) - 5,
                maximum: getMaximumPressure(ref) + 5,),
              tooltipBehavior: TooltipBehavior(enable: false),
              title: ChartTitle(
                  text: 'Pressure (%)'),
              series: <CartesianSeries<SensorData, String>>[
                LineSeries<SensorData, String>(
                  dataSource: getDashboardDataFromProvider.sensorReadings,
                  xValueMapper: (SensorData data, _) => data.time,
                  yValueMapper: (SensorData data, _) =>
                  data.pressure,
                  //sizeValueMapper: (datum, num) => num * 0.5,
                  name: 'Pressure',
                ),
              ]),
        ],),
      ),
    );
  }
}
