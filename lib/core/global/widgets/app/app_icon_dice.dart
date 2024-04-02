import 'package:flutter/material.dart';
import 'package:my_task/core/global_features/themes/presentation/theme/colors.dart';

class AppIconDice extends StatelessWidget {
  const AppIconDice({
    super.key,
    required this.lable,
    required this.backgroundColor,
    this.lableColor = whiteColor,
  });
  final String lable;
  final Color? lableColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          lable,
          style: TextStyle(
            color: lableColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
