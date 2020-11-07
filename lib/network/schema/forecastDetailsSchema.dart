import 'package:json_annotation/json_annotation.dart';
import 'package:weather/network/schema/weatherSchema.dart';

part "forecastDetailsSchema.g.dart";

@JsonSerializable()
class ForecastDetailsSchema {
  List<WeatherSchema> weather;

  ForecastDetailsSchema(this.weather);

  factory ForecastDetailsSchema.fromJson(Map<String, dynamic> json) => _$ForecastDetailsSchemaFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastDetailsSchemaToJson(this);
}