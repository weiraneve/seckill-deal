import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class LoginRequest {
  final String? mobile;
  final String? password;

  const LoginRequest(
    this.mobile,
    this.password,
  );

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
