// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecastDetailsSchema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDetailsSchema _$ForecastDetailsSchemaFromJson(
    Map<String, dynamic> json) {
  return ForecastDetailsSchema(
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
  );
}

Map<String, dynamic> _$ForecastDetailsSchemaToJson(
        ForecastDetailsSchema instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'weather': instance.weather,
      'main': instance.main,
      'wind': instance.wind,
      'visibility': instance.visibility,
    };
