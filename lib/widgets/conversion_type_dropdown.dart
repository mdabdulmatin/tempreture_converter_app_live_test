import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../models/conversion_type.dart';

class ConversionTypeDropdown extends StatelessWidget {
  const ConversionTypeDropdown({
    required this.selectedType,
    required this.onChanged,
    super.key,
  });

  final ConversionType selectedType;
  final ValueChanged<ConversionType?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Type',
          style: TextStyle(
            color: AppColors.secondaryText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonHideUnderline(
          child: DropdownButton<ConversionType>(
            key: const Key('conversionDropdown'),
            value: selectedType,
            isExpanded: true,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.secondaryText,
            ),
            selectedItemBuilder: (context) {
              return ConversionType.values.map((type) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    type.selectedLabel,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList();
            },
            items: ConversionType.values.map((type) {
              return DropdownMenuItem<ConversionType>(
                value: type,
                child: Text(
                  type.menuLabel,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
        const Divider(height: 1, thickness: 1, color: AppColors.underline),
      ],
    );
  }
}
