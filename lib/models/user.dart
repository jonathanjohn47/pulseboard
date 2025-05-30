import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@Freezed()
abstract class User with _$User {
  const factory User({
    required String id,
    required String name,
  }) = _User;
}