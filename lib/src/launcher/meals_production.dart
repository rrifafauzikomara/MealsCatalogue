import 'package:dicoding_submission/src/launcher/meals_config.dart';
import 'meals_app.dart';
import 'package:flutter/material.dart';

void main() {
  var configuredApp = AppConfig(
    appDisplayName: "Meals Catalogue",
    isDebug: false,
    appInternalId: 1,
    child: MyApp(),
  );

  runApp(configuredApp);
}