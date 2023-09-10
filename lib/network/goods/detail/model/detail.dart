import 'package:json_annotation/json_annotation.dart';

part 'detail.g.dart';

@JsonSerializable()
class Detail {
  final int? code;
  final String? msg;
  final String? data;

  Detail(this.code, this.msg, this.data);

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}
