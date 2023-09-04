import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String? registerMobile;
  final String? registerPassword;

  const RegisterRequest(
    this.registerMobile,
    this.registerPassword,
  );

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
