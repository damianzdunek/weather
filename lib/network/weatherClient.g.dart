// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _WeatherClient implements WeatherClient {
  _WeatherClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://api.openweathermap.org/data/2.5/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<ForecastSchema> getForecast() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'forecast?APPID=c12c4f042b6b42293d57b8b37a11147f&units=metric&lat=51.786691&lon=19.469261',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ForecastSchema.fromJson(_result.data);
    return value;
  }
}
