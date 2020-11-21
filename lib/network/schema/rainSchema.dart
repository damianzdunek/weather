import 'package:json_annotation/json_annotation.dart';

part 'rainSchema.g.dart';

@JsonSerializable()
class RainSchema {
  @JsonKey(name: "1h")
  double lastHour;

  @JsonKey(name: "3h")
  double lastThreeHours;

  RainSchema(this.lastHour, this.lastThreeHours);
}