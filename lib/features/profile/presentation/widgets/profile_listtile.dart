import 'package:flutter/material.dart';

class ProfileListTiles extends StatelessWidget {
  const ProfileListTiles({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  final IconData leadingIcon;
  final String title;
  final String subtitle;
  final IconData? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: Theme.of(context).colorScheme.onBackground,
        size: 25,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle.toString(),
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        trailing,
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
      ),
    );
  }
}
