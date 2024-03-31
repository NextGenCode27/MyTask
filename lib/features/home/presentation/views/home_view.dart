import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/themes/presentation/theme/colors.dart';
import 'package:my_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_task/features/profile/presentation/views/profile_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeView extends StatefulWidget {
  static route(User? user) => MaterialPageRoute(
        builder: (context) => HomeView(
          user: user,
        ),
      );
  const HomeView({super.key, this.user});
  final User? user;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
          return BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (value) {
              context
                  .read<HomeBloc>()
                  .add(HomeCurrentIndexEvent(currentIndex: value));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}

List<Widget> views = [
  const Center(
    child: Text(
      'Home View',
      style: TextStyle(
        color: blackColor,
      ),
    ),
  ),
  const ProfileView(),
];
