import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/models/dashboard_data.dart';
import 'package:pulseboard/models/sensor_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_provider.g.dart';

final DashboardData dashboardData = DashboardData(sensorReadings: [
  {
    "sensorId": "sensor_001",
    "temperature": 23.5,
    "humidity": 45.0,
    "pressure": 1013.25,
    "status": "mild",
    "time": "08:00"
  },
  {
    "sensorId": "sensor_002",
    "temperature": 25.1,
    "humidity": 5.2,
    "pressure": 1012.80,
    "status": "warm",
    "time": "08:15"
  },
  {
    "sensorId": "sensor_003",
    "temperature": 22.8,
    "humidity": 4.5,
    "pressure": 1014.00,
    "status": "mild",
    "time": "08:30"
  },
  {
    "sensorId": "sensor_004",
    "temperature": 27.0,
    "humidity": 55.0,
    "pressure": 1011.75,
    "status": "hot",
    "time": "08:45"
  },
  {
    "sensorId": "sensor_005",
    "temperature": 21.9,
    "humidity": 22.3,
    "pressure": 1013.50,
    "status": "cool",
    "time": "09:00"
  }
].map((element) {
  return SensorData.fromJson(element);
}).toList());

StateProvider<bool> isTemperatureProvider = StateProvider<bool>((ref) => true);

@riverpod
DashboardData getDashboardData(ref) {
  return dashboardData;
}

@riverpod
double getMaximumTemperature(ref) {
  final dashboardData = ref.watch(getDashboardDataProvider);

  return dashboardData.sensorReadings.map((e) => e.temperature).reduce((value,
      element) => value > element ? value : element);
}

@riverpod
double getMinimumTemperature(ref) {
  final dashboardData = ref.watch(getDashboardDataProvider);
  return dashboardData.sensorReadings.map((e) => e.temperature).reduce((value,
      element) => value < element ? value : element);
}

@riverpod
double getMinimumHumidity(ref) {
  final dashboardData = ref.watch(getDashboardDataProvider);
  return dashboardData.sensorReadings.map((e) => e.humidity).reduce((value,
      element) => value < element ? value : element);
}

@riverpod
double getMaximumHumidity(ref) {
  final dashboardData = ref.watch(getDashboardDataProvider);
  return dashboardData.sensorReadings.map((e) => e.humidity).reduce((value,
      element) => value > element ? value : element);
}

@riverpod
double getMaximumPressure(ref) {
  final dashboardData = ref.watch(getDashboardDataProvider);
  return dashboardData.sensorReadings.map((e) => e.pressure).reduce((value,
      element) => value > element ? value : element);
}

@riverpod
double getMinimumPressure(ref) {
  final dashboardData = ref.watch(getDashboardDataProvider);
  return dashboardData.sensorReadings.map((e) => e.pressure).reduce((value,
      element) => value < element ? value : element);
}