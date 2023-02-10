import 'package:flutter/material.dart';
import 'package:{{project_name}}/core/services/navigation_service.dart';
import 'package:{{project_name}}/helpers/dependency_assembly.dart';
import 'package:{{project_name}}/helpers/router_helper.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: dependencyAssembler<NavigationService>().navigatorKey,
      onGenerateRoute: RouterHelper.generateRoute,
      initialRoute: homeRoute,
    );
  }
}
