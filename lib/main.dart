import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/secrets/storage_secrets.dart';
import 'package:my_task/core/services/storage_service.dart';
import 'package:my_task/core/global_features/themes/presentation/theme/dark_theme.dart';
import 'package:my_task/core/global_features/themes/presentation/theme_bloc/theme_bloc.dart';
import 'package:my_task/core/global_features/user/bloc/user_bloc.dart';
import 'package:my_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_task/features/auth/presentation/view/welcome_view.dart';
import 'package:my_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_task/features/home/presentation/views/home_view.dart';
import 'package:my_task/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:my_task/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await iniDependencies();
  final bool isDarkTheme = await StorageService.getBool(key: themeKey) ?? false;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<ThemeBloc>()),
        BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
        BlocProvider(create: (context) => serviceLocator<UserBloc>()),
        BlocProvider(create: (context) => serviceLocator<HomeBloc>()),
        BlocProvider(create: (context) => serviceLocator<TaskBloc>()),
      ],
      child: MyApp(
        isDatkTheme: isDarkTheme,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.isDatkTheme});
  final bool isDatkTheme;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<ThemeBloc>().add(GetThemeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if (state is ThemeGetSuccess) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'M Y T A S K',
            theme: state.themeData,
            darkTheme: darkTheme,
            home: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLogOut) {
                  return const WelcomeView();
                }
                if (state is AuthSuccess) {
                  return const HomeView();
                }
                return const WelcomeView();
              },
            ),
          );
        }
        if (state is ThemeSetSuccess) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'M Y T A S K',
            theme: state.themeData,
            darkTheme: darkTheme,
            home: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLogOut) {
                  return const WelcomeView();
                }
                if (state is AuthSuccess) {
                  return const HomeView();
                }
                return const WelcomeView();
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
