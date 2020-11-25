import 'package:json_annotation/json_annotation.dart';
import 'package:weather/network/schema/mainSchema.dart';
import 'package:weather/network/schema/weatherSchema.dart';
import 'package:weather/network/schema/windSchema.dart';

part "currentWeatherSchema.g.dart";

@JsonSerializable()
class CurrentWeatherSchema {
  int dt;

  List<WeatherSchema> weather;

  MainSchema main;

  WindSchema wind;

  int visibility;

  String name;

  CurrentWeatherSchema(
      this.dt, this.weather, this.main, this.wind, this.visibility, this.name);

  factory CurrentWeatherSchema.fromJson(Map<String, dynamic> json) => _$CurrentWeatherSchemaFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherSchemaToJson(this);
}