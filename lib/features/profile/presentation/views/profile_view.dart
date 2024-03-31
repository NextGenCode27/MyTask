import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_task/core/global/widgets/custom_button.dart';
import 'package:my_task/core/user/bloc/user_bloc.dart';
import 'package:my_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_task/features/profile/presentation/widgets/profile_listtile.dart';
import 'package:my_task/features/profile/presentation/widgets/profile_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.all(size.width * 0.06),
            child: Column(
              children: [
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserSuccess) {
                      return ProfileCard(
                        size: size,
                        username: state.userEntity.username,
                        email: state.userEntity.email,
                      );
                    }
                    return const SizedBox();
                  },
                ),
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
                      // trailing: Iconsax.arrow_right,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  size: size,
                  lable: 'Log Out',
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
