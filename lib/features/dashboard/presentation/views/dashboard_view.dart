import 'package:flutter/material.dart';
import 'package:my_task/features/dashboard/presentation/widgets/add_task_floating_button.dart';

class DashboardView extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const DashboardView());
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            toolbarHeight: 100,
          ),
        ],
      ),
      floatingActionButton: const AddTaskFloatingButton(),
    );
  }
}
