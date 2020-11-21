import 'package:json_annotation/json_annotation.dart';

part 'citySchema.g.dart';

@JsonSerializable()
class CitySchema {
  String name;

  int population;

  int timezone;

  String country;

  int sunrise;

  int sunset;

  CitySchema(this.name, this.population, this.timezone, this.country,
      this.sunrise, this.sunset);

  factory CitySchema.fromJson(Map<String, dynamic> json) => _$CitySchemaFromJson(json);
  Map<String, dynamic> toJson() => _$CitySchemaToJson(this);

}