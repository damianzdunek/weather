import 'package:json_annotation/json_annotation.dart';

part 'weatherSchema.g.dart';

@JsonSerializable()
class WeatherSchema {
  int id;

  String main;

  String description;

  String icon;

  WeatherSchema(this.id, this.main, this.description, this.icon);

  factory WeatherSchema.fromJson(Map<String, dynamic> json) =>
      _$WeatherSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherSchemaToJson(this);
}
