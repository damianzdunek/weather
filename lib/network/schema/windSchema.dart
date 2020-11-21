import 'package:json_annotation/json_annotation.dart';

part 'windSchema.g.dart';

@JsonSerializable()
class WindSchema {
  double speed;

  int deg;

  WindSchema(this.speed, this.deg);

  factory WindSchema.fromJson(Map<String, dynamic> json) =>
      _$WindSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$WindSchemaToJson(this);
}
