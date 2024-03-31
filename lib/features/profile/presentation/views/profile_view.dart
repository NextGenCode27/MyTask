import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_task/core/global/widgets/custom_button.dart';
import 'package:my_task/features/auth/presentation/bloc/auth_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         context.read<AuthBloc>().add(AuthLogOutEvent());
      //       },
      //       icon: Icon(
      //         Iconsax.logout,
      //         color: Theme.of(context).colorScheme.primary,
      //       ),
      //     ),
      //   ],
      //   backgroundColor: Theme.of(context).colorScheme.background,
      // ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.all(size.width * 0.06),
            child: Column(
              children: [
                ProfileCard(size: size),
                const SizedBox(
                  height: 50,
                ),
                const Column(
                  children: [
                    ProfileListTiles(
                      leadingIcon: Iconsax.setting,
                      title: 'Settings',
                      subtitle: 'You can manage all app settings.',
                      trailing: Iconsax.arrow_right,
                    ),
                    ProfileListTiles(
                      leadingIcon: Iconsax.user,
                      title: 'User Settings',
                      subtitle: 'You can manage all your settings.',
                      trailing: Iconsax.arrow_right,
                    ),
                    ProfileListTiles(
                      leadingIcon: Iconsax.document,
                      title: 'Terms & Conditions',
                      subtitle: 'Legal terms and conditions.',
                      trailing: Iconsax.arrow_right,
                    ),
                    ProfileListTiles(
                      leadingIcon: Iconsax.support,
                      title: 'Support',
                      subtitle: 'Any technical support',
                      trailing: Iconsax.arrow_right,
                    ),
                    ProfileListTiles(
                      leadingIcon: Iconsax.info_circle,
                      title: 'About',
                      subtitle: 'Version : 1.0.1',
                      trailing: Iconsax.arrow_right,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  size: size,
                  lable: 'Log Out',
                  lableColor: Theme.of(context).colorScheme.background,
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthLogOutEvent());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileListTiles extends StatelessWidget {
  const ProfileListTiles({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  final IconData leadingIcon;
  final String title;
  final String subtitle;
  final IconData trailing;

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

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.5,
      width: size.width,
      padding: EdgeInsets.all(size.width * 0.05),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 50,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Javed Pathan',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'javedpathan855@gmail.com',
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
