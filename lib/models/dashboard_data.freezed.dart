// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardData {

 List<SensorData> get sensorReadings;
/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardDataCopyWith<DashboardData> get copyWith => _$DashboardDataCopyWithImpl<DashboardData>(this as DashboardData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardData&&const DeepCollectionEquality().equals(other.sensorReadings, sensorReadings));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sensorReadings));

@override
String toString() {
  return 'DashboardData(sensorReadings: $sensorReadings)';
}


}

/// @nodoc
abstract mixin class $DashboardDataCopyWith<$Res>  {
  factory $DashboardDataCopyWith(DashboardData value, $Res Function(DashboardData) _then) = _$DashboardDataCopyWithImpl;
@useResult
$Res call({
 List<SensorData> sensorReadings
});




}
/// @nodoc
class _$DashboardDataCopyWithImpl<$Res>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._self, this._then);

  final DashboardData _self;
  final $Res Function(DashboardData) _then;

/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sensorReadings = null,}) {
  return _then(_self.copyWith(
sensorReadings: null == sensorReadings ? _self.sensorReadings : sensorReadings // ignore: cast_nullable_to_non_nullable
as List<SensorData>,
  ));
}

}


/// @nodoc


class _DashboardData implements DashboardData {
  const _DashboardData({required final  List<SensorData> sensorReadings}): _sensorReadings = sensorReadings;
  

 final  List<SensorData> _sensorReadings;
@override List<SensorData> get sensorReadings {
  if (_sensorReadings is EqualUnmodifiableListView) return _sensorReadings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sensorReadings);
}


/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardDataCopyWith<_DashboardData> get copyWith => __$DashboardDataCopyWithImpl<_DashboardData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardData&&const DeepCollectionEquality().equals(other._sensorReadings, _sensorReadings));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sensorReadings));

@override
String toString() {
  return 'DashboardData(sensorReadings: $sensorReadings)';
}


}

/// @nodoc
abstract mixin class _$DashboardDataCopyWith<$Res> implements $DashboardDataCopyWith<$Res> {
  factory _$DashboardDataCopyWith(_DashboardData value, $Res Function(_DashboardData) _then) = __$DashboardDataCopyWithImpl;
@override @useResult
$Res call({
 List<SensorData> sensorReadings
});




}
/// @nodoc
class __$DashboardDataCopyWithImpl<$Res>
    implements _$DashboardDataCopyWith<$Res> {
  __$DashboardDataCopyWithImpl(this._self, this._then);

  final _DashboardData _self;
  final $Res Function(_DashboardData) _then;

/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sensorReadings = null,}) {
  return _then(_DashboardData(
sensorReadings: null == sensorReadings ? _self._sensorReadings : sensorReadings // ignore: cast_nullable_to_non_nullable
as List<SensorData>,
  ));
}


}

// dart format on
