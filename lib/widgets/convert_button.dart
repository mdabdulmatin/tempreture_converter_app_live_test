import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ConvertButton extends StatelessWidget {
  const ConvertButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        key: const Key('convertButton'),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'Convert',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
