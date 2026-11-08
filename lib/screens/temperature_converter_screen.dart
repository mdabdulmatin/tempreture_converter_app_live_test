import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../providers/temperature_converter_provider.dart';
import '../widgets/conversion_type_dropdown.dart';
import '../widgets/convert_button.dart';
import '../widgets/result_section.dart';
import '../widgets/temperature_input_field.dart';

class TemperatureConverterScreen extends StatelessWidget {
  const TemperatureConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final converter = context.watch<TemperatureConverterProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Temperature Converter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.text,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 42),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TemperatureInputField(
                          errorMessage: converter.errorMessage,
                          onChanged: context
                              .read<TemperatureConverterProvider>()
                              .updateInput,
                          onSubmitted: (_) => context
                              .read<TemperatureConverterProvider>()
                              .convertTemperature(),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ConversionTypeDropdown(
                          selectedType: converter.selectedType,
                          onChanged: context
                              .read<TemperatureConverterProvider>()
                              .updateConversionType,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 34),
                  ResultSection(resultText: converter.resultText),
                  const SizedBox(height: 34),
                  ConvertButton(
                    onPressed: context
                        .read<TemperatureConverterProvider>()
                        .convertTemperature,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
