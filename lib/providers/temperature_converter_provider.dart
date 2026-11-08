import 'package:flutter/foundation.dart';

import '../models/conversion_type.dart';

class TemperatureConverterProvider extends ChangeNotifier {
  String _inputValue = '';
  ConversionType _selectedType = ConversionType.fahrenheitToCelsius;
  double? _result;
  String? _errorMessage;

  String get inputValue => _inputValue;
  ConversionType get selectedType => _selectedType;
  double? get result => _result;
  String? get errorMessage => _errorMessage;

  String? get resultText {
    if (_result == null) return null;
    return '${_result!.toStringAsFixed(2)} ${_selectedType.outputUnit}';
  }

  void updateInput(String value) {
    _inputValue = value;
    _result = null;
    _errorMessage = null;
    notifyListeners();
  }

  void updateConversionType(ConversionType? type) {
    if (type == null || type == _selectedType) return;

    _selectedType = type;
    _result = null;
    _errorMessage = null;
    notifyListeners();
  }

  void convertTemperature() {
    final value = _inputValue.trim();

    if (value.isEmpty) {
      _showError('Please enter a temperature.');
      return;
    }

    final temperature = double.tryParse(value);
    if (temperature == null || !temperature.isFinite) {
      _showError('Please enter a valid number.');
      return;
    }

    final convertedValue = _selectedType.convert(temperature);
    if (!convertedValue.isFinite) {
      _showError('This temperature is too large to convert.');
      return;
    }

    _result = convertedValue;
    _errorMessage = null;
    notifyListeners();
  }

  void _showError(String message) {
    _result = null;
    _errorMessage = message;
    notifyListeners();
  }
}
