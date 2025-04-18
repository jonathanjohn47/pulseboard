import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_data.freezed.dart';
part 'sensor_data.g.dart';

@freezed
abstract class SensorData with _$SensorData {
  const factory SensorData({
    required String sensorId,
    required double temperature,
    required double humidity,
    required double pressure,
    required String status, // e.g., 'green', 'yellow', etc.
    required String time, // e.g., '08:00'
  }) = _SensorData;

  factory SensorData.fromJson(Map<String, dynamic> json) => _$SensorDataFromJson(json);
}