// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecastDetailsSchema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDetailsSchema _$ForecastDetailsSchemaFromJson(
    Map<String, dynamic> json) {
  return ForecastDetailsSchema(
    (json['weather'] as List)
        ?.map((e) => e == null
            ? null
            : WeatherSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ForecastDetailsSchemaToJson(
        ForecastDetailsSchema instance) =>
    <String, dynamic>{
      'weather': instance.weather,
    };
