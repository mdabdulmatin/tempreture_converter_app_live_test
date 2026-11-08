import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ResultSection extends StatelessWidget {
  const ResultSection({required this.resultText, super.key});

  final String? resultText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Result',
          style: TextStyle(
            color: AppColors.secondaryText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          resultText ?? 'Your result will appear here',
          key: resultText == null ? null : const Key('conversionResult'),
          style: TextStyle(
            color: resultText == null
                ? AppColors.secondaryText
                : AppColors.text,
            fontSize: resultText == null ? 15 : 27,
            fontWeight: resultText == null
                ? FontWeight.w400
                : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
