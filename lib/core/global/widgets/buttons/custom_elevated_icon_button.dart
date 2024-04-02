import 'package:flutter/material.dart';
import 'package:my_task/core/global_features/themes/presentation/theme/colors.dart';

class CustomElevatedIconButton extends StatelessWidget {
  const CustomElevatedIconButton({
    super.key,
    required this.backgroundColor,
    required this.lable,
    required this.onPressed,
    required this.icon,
  });

  final Color backgroundColor;
  final String lable;
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: Size(size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      icon: Icon(
        icon,
        color: whiteColor,
      ),
      label: Text(
        lable,
        style: const TextStyle(color: whiteColor, letterSpacing: 2.0),
      ),
    );
  }
}
