// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rainSchema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RainSchema _$RainSchemaFromJson(Map<String, dynamic> json) {
  return RainSchema(
    (json['1h'] as num)?.toDouble(),
    (json['3h'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RainSchemaToJson(RainSchema instance) =>
    <String, dynamic>{
      '1h': instance.lastHour,
      '3h': instance.lastThreeHours,
    };
