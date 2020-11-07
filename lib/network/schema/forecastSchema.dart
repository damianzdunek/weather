import 'package:json_annotation/json_annotation.dart';

part 'forecastSchema.g.dart';

@JsonSerializable()
class ForecastSchema {
  String cod;

  ForecastSchema(this.cod);

  factory ForecastSchema.fromJson(Map<String, dynamic> json) => _$ForecastSchemaFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastSchemaToJson(this);
}