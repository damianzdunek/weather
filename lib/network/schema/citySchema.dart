import 'package:json_annotation/json_annotation.dart';

part 'citySchema.g.dart';

@JsonSerializable()
class CitySchema {
  String name;

  CitySchema(this.name);

  factory CitySchema.fromJson(Map<String, dynamic> json) => _$CitySchemaFromJson(json);
  Map<String, dynamic> toJson() => _$CitySchemaToJson(this);

}