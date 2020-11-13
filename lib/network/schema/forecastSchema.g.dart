// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecastSchema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastSchema _$ForecastSchemaFromJson(Map<String, dynamic> json) {
  return ForecastSchema(
    (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : ForecastDetailsSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['city'] == null
        ? null
        : CitySchema.fromJson(json['city'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ForecastSchemaToJson(ForecastSchema instance) =>
    <String, dynamic>{
      'list': instance.list,
      'city': instance.city,
    };
