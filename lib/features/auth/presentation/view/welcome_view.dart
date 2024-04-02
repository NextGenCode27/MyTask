import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/global/widgets/app/app_icon.dart';
import 'package:my_task/core/global/widgets/buttons/custom_elevated_button.dart';
import 'package:my_task/core/global_features/themes/presentation/theme/light_theme.dart';
import 'package:my_task/core/global_features/themes/presentation/theme_bloc/theme_bloc.dart';
import 'package:my_task/features/auth/presentation/view/login_view.dart';
import 'package:my_task/features/auth/presentation/view/register_view.dart';

class WelcomeView extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const WelcomeView());
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //dark mode icon
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    if (state is ThemeGetSuccess) {
                      return IconButton(
                        onPressed: () {
                          context.read<ThemeBloc>().add(SetThemeEvent());
                        },
                        style: IconButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                        icon: state.themeData == lightTheme
                            ? Icon(
                                Icons.light,
                                color: Theme.of(context).colorScheme.background,
                              )
                            : Icon(
                                Icons.sunny,
                                color: Theme.of(context).colorScheme.background,
                              ),
                      );
                    }
                    if (state is ThemeSetSuccess) {
                      return IconButton(
                        onPressed: () {
                          context.read<ThemeBloc>().add(SetThemeEvent());
                        },
                        style: IconButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                        icon: state.themeData == lightTheme
                            ? Icon(
                                Icons.light,
                                color: Theme.of(context).colorScheme.background,
                              )
                            : Icon(
                                Icons.sunny,
                                color: Theme.of(context).colorScheme.background,
                              ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),

            //App logo
            const AppIcon(),

            //Auth Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to\nthe new\nTask App',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                //App slogan
                Text(
                  'New level of features\nwith new app',
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.7),
                    fontSize: 16,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),

            //Input buttons
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomElevatedButton(
                        size: size,
                        lable: 'Log In',
                        lableColor: Theme.of(context).colorScheme.background,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          Navigator.of(context).push(LoginView.route());
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        size: size,
                        lable: '?',
                        lableColor: Theme.of(context).colorScheme.background,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButton(
                  size: size,
                  lable: 'Become a member',
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    Navigator.of(context).push(RegisterView.route());
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
