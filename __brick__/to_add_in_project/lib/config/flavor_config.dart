import 'package:flutter/material.dart';
import 'package:{{project_name}}/helpers/utils.dart';

enum Flavor { DEV, PROD }

class FlavorValues {
  FlavorValues({
    required this.baseUrl,
    // required this.scannerUrl,
    // required this.oneSignalAppID,
  });
  final String baseUrl;
  // final String scannerUrl;
  // final String oneSignalAppID;
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static FlavorConfig? _instance;

  factory FlavorConfig(
      {required Flavor flavor,
      Color color: Colors.blue,
      required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(
        flavor, Utils.enumName(flavor.toString()), color, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);
  static FlavorConfig? get instance {
    return _instance;
  }

  static bool isProduction() => _instance!.flavor == Flavor.PROD;
  static bool isDev() => _instance!.flavor == Flavor.DEV;
}
