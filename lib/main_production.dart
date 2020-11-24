import 'package:Flutter_Boilerplate/app.dart';
import 'package:flutter/material.dart';

import 'core/dependecyInjection/get_it_dependency.dart';
import 'core/environment/app_configuration.dart';
import 'core/environment/flavor.dart';

void main() {
  AppConfig().initialize(ProductionFlavor());
  GetItDependency().init();
  
  runApp(App());
}