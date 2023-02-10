import 'package:flutter/material.dart';
import 'package:{{project_name}}/config/flavor_config.dart';
import 'package:{{project_name}}/helpers/dependency_assembly.dart';
import 'package:{{project_name}}/my_app.dart';

void main() async {
  // bypass bad https certificates
  // HttpOverrides.global = new UnsafeHttpOverrides();

  FlavorConfig(
    flavor: Flavor.PROD,
    color: Colors.green,
    values: FlavorValues(
      baseUrl: "http://192.168.1.1",
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyAssembler();

  runApp(MyApp());
}
