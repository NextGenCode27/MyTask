import 'package:flutter/material.dart';
import 'package:my_task/core/global/widgets/app/app_icon_dice.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppIconDice(
              lable: 'T',
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              width: 5,
            ),
            AppIconDice(
              lable: 'A',
              lableColor: Theme.of(context).colorScheme.background,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            AppIconDice(
              lable: 'S',
              lableColor: Theme.of(context).colorScheme.background,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              width: 5,
            ),
            AppIconDice(
              lable: 'K',
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ],
    );
  }
}
