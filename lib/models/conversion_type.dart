enum ConversionType {
  celsiusToFahrenheit(
    menuLabel: 'Celsius to Fahrenheit (°C → °F)',
    selectedLabel: 'Celsius',
    inputUnit: '°C',
    outputUnit: '°F',
  ),
  fahrenheitToCelsius(
    menuLabel: 'Fahrenheit to Celsius (°F → °C)',
    selectedLabel: 'Fahrenheit',
    inputUnit: '°F',
    outputUnit: '°C',
  );

  const ConversionType({
    required this.menuLabel,
    required this.selectedLabel,
    required this.inputUnit,
    required this.outputUnit,
  });

  final String menuLabel;
  final String selectedLabel;
  final String inputUnit;
  final String outputUnit;

  double convert(double temperature) {
    switch (this) {
      case ConversionType.celsiusToFahrenheit:
        return (temperature * 9 / 5) + 32;
      case ConversionType.fahrenheitToCelsius:
        return (temperature - 32) * 5 / 9;
    }
  }
}
