import 'package:flutter/material.dart';

import 'screens/temperature_converter_screen.dart';

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Temperature Converter',
      debugShowCheckedModeBanner: false,
      home: TemperatureConverterScreen(),
    );
  }
}
