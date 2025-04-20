import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/providers/dashboard_provider.dart';
import 'package:pulseboard/widgets/app_bar_action_icon.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/sensor_data.dart';
import '../utility/router.dart';

@RoutePage()
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final getDashboardDataFromProvider = ref.watch(getDashboardDataProvider);
    final isTemperature = ref.watch(isTemperatureProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sensor Overview"),
        actions: [
          AppBarActionIcon(icon: Icons.settings, onPressed: () {}),
          AppBarActionIcon(icon: Icons.details, onPressed: () {
            AutoRouter.of(context).push(DetailsScreenRoute());
          }),
        ],
      ),
      body: Column(children: [
        SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
                minimum: isTemperature
                    ? getMinimumTemperature(ref) - 1
                    : getMinimumHumidity(ref) - 5,
                maximum: isTemperature
                    ? getMaximumTemperature(ref) + 1
                    : getMaximumHumidity(ref) + 5),
            tooltipBehavior: TooltipBehavior(enable: false),
            title: ChartTitle(
                text: isTemperature ? 'Temperature (°C)' : 'Humidity (%)'),
            series: <CartesianSeries<SensorData, String>>[
              BubbleSeries<SensorData, String>(
                  dataSource: getDashboardDataFromProvider.sensorReadings,
                  xValueMapper: (SensorData data, _) => data.status,
                  yValueMapper: (SensorData data, _) =>
                  data.temperature,
                  sizeValueMapper: (datum, num) => num * 2,
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
                  }),
              BubbleSeries<SensorData, String>(
                  dataSource: getDashboardDataFromProvider.sensorReadings,
                  xValueMapper: (SensorData data, _) => data.status,
                  yValueMapper: (SensorData data, _) =>
                  data.humidity,
                  sizeValueMapper: (datum, num) => num * 2,
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
        SizedBox(height: 20,),
        Text("Maximum ${isTemperature
            ? "Temperature"
            : "Humidity"}: ${isTemperature
            ? getMaximumTemperature(ref)
            : getMaximumHumidity(ref)}"),
        Text("Minimum ${isTemperature
            ? "Temperature"
            : "Humidity"}: ${isTemperature
            ? getMinimumTemperature(ref)
            : getMinimumHumidity(ref)}"),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
              ref
                  .read(isTemperatureProvider.notifier)
                  .state = true,
              child: Text("Temperature", style: TextStyle(
                  color: isTemperature ? Colors.white : Colors.blue)),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  side: BorderSide(
                      color: Colors.grey), // Optional: Add a border
                ),
                backgroundColor: isTemperature ? Colors.blue : null,
              ),

            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(isTemperatureProvider.notifier)
                    .state = false;
              },
              child: Text("Humidity", style: TextStyle(
                  color: isTemperature ? Colors.blue : Colors.white)),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  side: BorderSide(
                      color: Colors.grey), // Optional: Add a border
                ),
                backgroundColor: !isTemperature ? Colors.blue : null,
              ),),
          ],)
      ],),
    );
  }
}
