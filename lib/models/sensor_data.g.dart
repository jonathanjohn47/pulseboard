// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SensorData _$SensorDataFromJson(Map<String, dynamic> json) => _SensorData(
  sensorId: json['sensorId'] as String,
  temperature: (json['temperature'] as num).toDouble(),
  humidity: (json['humidity'] as num).toDouble(),
  pressure: (json['pressure'] as num).toDouble(),
  status: json['status'] as String,
  time: json['time'] as String,
);

Map<String, dynamic> _$SensorDataToJson(_SensorData instance) =>
    <String, dynamic>{
      'sensorId': instance.sensorId,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'status': instance.status,
      'time': instance.time,
    };
