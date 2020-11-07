import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather/network/weatherClientConstants.dart';

import 'schema/forecastSchema.dart';

part 'weatherClient.g.dart';

@RestApi(baseUrl: "http://api.openweathermap.org/data/2.5/")
abstract class WeatherClient {
  factory WeatherClient(Dio dio) = _WeatherClient;

  @GET("forecast?APPID=${WeatherClientConstants.appId}&units=metric")
  Future<ForecastSchema> getForecast(@Query("lat") double lat, @Query("lon") double lon);
}
