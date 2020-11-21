// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citySchema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitySchema _$CitySchemaFromJson(Map<String, dynamic> json) {
  return CitySchema(
    json['name'] as String,
    json['population'] as int,
    json['timezone'] as int,
    json['country'] as String,
    json['sunrise'] as int,
    json['sunset'] as int,
  );
}

Map<String, dynamic> _$CitySchemaToJson(CitySchema instance) =>
    <String, dynamic>{
      'name': instance.name,
      'population': instance.population,
      'timezone': instance.timezone,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
