import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/global/widgets/widgets/loader.dart';
import 'package:my_task/core/global_features/user/bloc/user_bloc.dart';
import 'package:my_task/features/auth/presentation/bloc/auth_bloc.dart' as auth;
import 'package:my_task/features/auth/presentation/view/welcome_view.dart';
import 'package:my_task/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:my_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_task/features/profile/presentation/views/profile_view.dart';
import 'package:my_task/features/tasks/presentation/views/task_view.dart';

class HomeView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetCurrentUserDataEvent());
    context.read<HomeBloc>().add(HomeCurrentIndexEvent(currentIndex: 0));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<auth.AuthBloc, auth.AuthState>(
      listener: (context, state) {
        if (state is auth.AuthLogOut) {
          Navigator.of(context)
              .pushAndRemoveUntil(WelcomeView.route(), (route) => false);
        }
      },
      builder: (context, state) {
        if (state is auth.AuthLoading) {
          return const Scaffold(
            body: Center(
              child: Loader(),
            ),
          );
        }
        return Scaffold(
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return views.elementAt(currentIndex);
            },
          ),
          bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeCurrentIndexSuccess) {
                currentIndex = state.currentIndex;
              }
              return ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: SizedBox(
                  height: 100,
                  child: BottomNavigationBar(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: currentIndex,
                    selectedItemColor: Theme.of(context).colorScheme.secondary,
                    unselectedItemColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.5),
                    iconSize: 25,
                    onTap: (value) {
                      context
                          .read<HomeBloc>()
                          .add(HomeCurrentIndexEvent(currentIndex: value));
                    },
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard),
                        label: 'Dashboard',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.task),
                        label: 'Tasks',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

List<Widget> views = [
  const DashboardView(),
  const TaskView(),
  const ProfileView(),
];
