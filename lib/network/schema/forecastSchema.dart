import 'package:json_annotation/json_annotation.dart';
import 'package:weather/network/schema/weatherSchema.dart';
import 'package:weather/network/schema/forecastDetailsSchema.dart';

part 'forecastSchema.g.dart';

@JsonSerializable()
class ForecastSchema {
  List<ForecastDetailsSchema> list;

  ForecastSchema(this.list);

  factory ForecastSchema.fromJson(Map<String, dynamic> json) => _$ForecastSchemaFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastSchemaToJson(this);
}