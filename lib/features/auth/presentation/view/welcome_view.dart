import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/global/widgets/app_icon.dart';
import 'package:my_task/core/global/widgets/custom_button.dart';
import 'package:my_task/core/themes/theme_bloc/theme_bloc.dart';

class WelcomeView extends StatefulWidget {
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
              children: [
                IconButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(SetThemeEvent());
                  },
                  icon: Icon(
                    Icons.light_mode_rounded,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
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
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                //App slogan
                Text(
                  'New level of features\nwith new app',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 16,
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
                      child: CustomButton(
                        size: size,
                        lable: 'Log In',
                        lableColor: Theme.of(context).colorScheme.onSecondary,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomButton(
                        size: size,
                        lable: '?',
                        lableColor: Theme.of(context).colorScheme.onSecondary,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  size: size,
                  lable: 'Become a member',
                  lableColor: Theme.of(context).colorScheme.onSurface,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
