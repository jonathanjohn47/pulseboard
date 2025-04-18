// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SensorData {

 String get sensorId; double get temperature; double get humidity; double get pressure; String get status;// e.g., 'green', 'yellow', etc.
 String get time;
/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorDataCopyWith<SensorData> get copyWith => _$SensorDataCopyWithImpl<SensorData>(this as SensorData, _$identity);

  /// Serializes this SensorData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorData&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.status, status) || other.status == status)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensorId,temperature,humidity,pressure,status,time);

@override
String toString() {
  return 'SensorData(sensorId: $sensorId, temperature: $temperature, humidity: $humidity, pressure: $pressure, status: $status, time: $time)';
}


}

/// @nodoc
abstract mixin class $SensorDataCopyWith<$Res>  {
  factory $SensorDataCopyWith(SensorData value, $Res Function(SensorData) _then) = _$SensorDataCopyWithImpl;
@useResult
$Res call({
 String sensorId, double temperature, double humidity, double pressure, String status, String time
});




}
/// @nodoc
class _$SensorDataCopyWithImpl<$Res>
    implements $SensorDataCopyWith<$Res> {
  _$SensorDataCopyWithImpl(this._self, this._then);

  final SensorData _self;
  final $Res Function(SensorData) _then;

/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sensorId = null,Object? temperature = null,Object? humidity = null,Object? pressure = null,Object? status = null,Object? time = null,}) {
  return _then(_self.copyWith(
sensorId: null == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SensorData implements SensorData {
  const _SensorData({required this.sensorId, required this.temperature, required this.humidity, required this.pressure, required this.status, required this.time});
  factory _SensorData.fromJson(Map<String, dynamic> json) => _$SensorDataFromJson(json);

@override final  String sensorId;
@override final  double temperature;
@override final  double humidity;
@override final  double pressure;
@override final  String status;
// e.g., 'green', 'yellow', etc.
@override final  String time;

/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorDataCopyWith<_SensorData> get copyWith => __$SensorDataCopyWithImpl<_SensorData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SensorDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorData&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.status, status) || other.status == status)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensorId,temperature,humidity,pressure,status,time);

@override
String toString() {
  return 'SensorData(sensorId: $sensorId, temperature: $temperature, humidity: $humidity, pressure: $pressure, status: $status, time: $time)';
}


}

/// @nodoc
abstract mixin class _$SensorDataCopyWith<$Res> implements $SensorDataCopyWith<$Res> {
  factory _$SensorDataCopyWith(_SensorData value, $Res Function(_SensorData) _then) = __$SensorDataCopyWithImpl;
@override @useResult
$Res call({
 String sensorId, double temperature, double humidity, double pressure, String status, String time
});




}
/// @nodoc
class __$SensorDataCopyWithImpl<$Res>
    implements _$SensorDataCopyWith<$Res> {
  __$SensorDataCopyWithImpl(this._self, this._then);

  final _SensorData _self;
  final $Res Function(_SensorData) _then;

/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sensorId = null,Object? temperature = null,Object? humidity = null,Object? pressure = null,Object? status = null,Object? time = null,}) {
  return _then(_SensorData(
sensorId: null == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
