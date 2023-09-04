import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class LoginResponse {
  final int? code;
  final String? data;
  final String? msg;

  const LoginResponse(
    this.code,
    this.data,
    this.msg,
  );

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
