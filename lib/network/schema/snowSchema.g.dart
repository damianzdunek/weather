// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snowSchema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnowSchema _$SnowSchemaFromJson(Map<String, dynamic> json) {
  return SnowSchema(
    (json['1h'] as num)?.toDouble(),
    (json['3h'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SnowSchemaToJson(SnowSchema instance) =>
    <String, dynamic>{
      '1h': instance.lastHour,
      '3h': instance.lastThreeHours,
    };
