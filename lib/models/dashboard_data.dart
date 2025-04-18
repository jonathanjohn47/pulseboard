import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pulseboard/models/sensor_data.dart';

part 'dashboard_data.freezed.dart';

@Freezed()
abstract class DashboardData with _$DashboardData {
  const factory DashboardData({
    required List<SensorData> sensorReadings,
  }) = _DashboardData;
}