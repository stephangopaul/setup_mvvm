import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:{{project_name}}/config/flavor_config.dart';

class API {
  static final String baseUrl = FlavorConfig.instance!.values.baseUrl;

  static Dio getHttpClient() {
    if (kDebugMode) {
      return Dio()..interceptors.add(PrettyDioLogger());
    } else {
      return Dio();
    }
  }
}
