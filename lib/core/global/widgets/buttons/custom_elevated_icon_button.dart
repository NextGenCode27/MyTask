import 'package:flutter/material.dart';
import 'package:my_task/core/global_features/themes/presentation/theme/colors.dart';

class CustomElevatedIconButton extends StatelessWidget {
  const CustomElevatedIconButton({
    super.key,
    required this.backgroundColor,
    this.lableColor = whiteColor,
    required this.lable,
    required this.onPressed,
    required this.icon,
    this.iconColor = whiteColor,
  });

  final Color backgroundColor;
  final String lable;
  final Color? lableColor;
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor;
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
        color: iconColor,
      ),
      label: Text(
        lable,
        style: TextStyle(
          color: lableColor,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}
