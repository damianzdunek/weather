// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currentWeatherSchema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherSchema _$CurrentWeatherSchemaFromJson(Map<String, dynamic> json) {
  return CurrentWeatherSchema(
    json['dt'] as int,
    (json['weather'] as List)
        ?.map((e) => e == null
            ? null
            : WeatherSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['main'] == null
        ? null
        : MainSchema.fromJson(json['main'] as Map<String, dynamic>),
    json['wind'] == null
        ? null
        : WindSchema.fromJson(json['wind'] as Map<String, dynamic>),
    json['visibility'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$CurrentWeatherSchemaToJson(
        CurrentWeatherSchema instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'weather': instance.weather,
      'main': instance.main,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'name': instance.name,
    };
