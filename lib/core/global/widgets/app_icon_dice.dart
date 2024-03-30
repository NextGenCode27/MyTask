import 'package:flutter/material.dart';

class AppIconDice extends StatelessWidget {
  const AppIconDice({
    super.key,
    required this.lable,
    required this.backgroundColor,
  });
  final String lable;
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
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
