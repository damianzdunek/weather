import 'package:json_annotation/json_annotation.dart';

part 'mainSchema.g.dart';

@JsonSerializable()
class MainSchema {
  double temp;

  double feels_like;

  int pressure;

  int humidity;

  MainSchema(this.temp);

  factory MainSchema.fromJson(Map<String, dynamic> json) => _$MainSchemaFromJson(json);
  Map<String, dynamic> toJson() => _$MainSchemaToJson(this);

}