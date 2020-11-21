import 'package:json_annotation/json_annotation.dart';

part 'snowSchema.g.dart';

@JsonSerializable()
class SnowSchema {
  @JsonKey(name: "1h")
  double lastHour;

  @JsonKey(name: "3h")
  double lastThreeHours;

  SnowSchema(this.lastHour, this.lastThreeHours);
}