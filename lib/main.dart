import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/services/storage_service.dart';
import 'package:my_task/core/themes/dark_theme.dart';
import 'package:my_task/core/themes/theme_bloc/theme_bloc.dart';
import 'package:my_task/features/auth/presentation/view/welcome_view.dart';
import 'package:my_task/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await iniDependencies();
  final bool isDarkTheme =
      await StorageService.getBool(key: 'isDarkTheme') ?? false;
  print(isDarkTheme);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<ThemeBloc>(),
        ),
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
            home: const WelcomeView(),
          );
        }
        if (state is ThemeSetSuccess) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'M Y T A S K',
            theme: state.themeData,
            darkTheme: darkTheme,
            home: const WelcomeView(),
          );
        }
        return const SizedBox();
      },
    );
  }
}
