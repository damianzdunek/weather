import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather/network/weatherClientConstants.dart';

import 'forecastSchema.dart';

part 'weatherClient.g.dart';

@RestApi(baseUrl: "http://api.openweathermap.org/data/2.5/")
abstract class WeatherClient {
  factory WeatherClient(Dio dio) = _WeatherClient;

  @GET("forecast?APPID=${WeatherClientConstants.appId}&units=metric&lat=51.786691&lon=19.469261")
  Future<ForecastSchema> getForecast();
}
