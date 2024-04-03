import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/global/widgets/widgets/loader.dart';
import 'package:my_task/features/tasks/presentation/bloc/task_bloc.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(FetchTaskEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return const Loader();
          }
          if (state is TaskSuccess) {
            return ListView.builder(
              itemCount: state.taskEntity.length,
              itemBuilder: (contex, index) {
                return Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  padding: const EdgeInsets.all(30),
                  color: Theme.of(context).colorScheme.secondary,
                  child: Center(
                    child: Text(
                      state.taskEntity[index].username,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
