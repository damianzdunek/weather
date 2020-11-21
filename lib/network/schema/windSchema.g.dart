// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'windSchema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindSchema _$WindSchemaFromJson(Map<String, dynamic> json) {
  return WindSchema(
    (json['speed'] as num)?.toDouble(),
    json['deg'] as int,
  );
}

Map<String, dynamic> _$WindSchemaToJson(WindSchema instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };
