// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainSchema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainSchema _$MainSchemaFromJson(Map<String, dynamic> json) {
  return MainSchema(
    (json['temp'] as num)?.toDouble(),
  )
    ..feels_like = (json['feels_like'] as num)?.toDouble()
    ..pressure = json['pressure'] as int
    ..humidity = json['humidity'] as int;
}

Map<String, dynamic> _$MainSchemaToJson(MainSchema instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
