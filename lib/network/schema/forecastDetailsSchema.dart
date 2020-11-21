import 'package:json_annotation/json_annotation.dart';
import 'package:weather/network/schema/mainSchema.dart';
import 'package:weather/network/schema/weatherSchema.dart';
import 'package:weather/network/schema/windSchema.dart';

part "forecastDetailsSchema.g.dart";

@JsonSerializable()
class ForecastDetailsSchema {
  int dt;

  List<WeatherSchema> weather;

  MainSchema main;

  WindSchema wind;

  int visibility;

  ForecastDetailsSchema(
      this.dt, this.weather, this.main, this.wind, this.visibility);

  factory ForecastDetailsSchema.fromJson(Map<String, dynamic> json) => _$ForecastDetailsSchemaFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastDetailsSchemaToJson(this);
}