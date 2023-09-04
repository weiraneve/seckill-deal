import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final int? code;
  final String? data;
  final String? msg;

  const RegisterResponse(
    this.code,
    this.data,
    this.msg,
  );

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
