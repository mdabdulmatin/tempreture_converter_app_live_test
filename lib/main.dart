import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/temperature_converter_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TemperatureConverterProvider(),
      child: const TemperatureConverterApp(),
    ),
  );
}
