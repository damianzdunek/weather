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
  );
}

Map<String, dynamic> _$ForecastSchemaToJson(ForecastSchema instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
