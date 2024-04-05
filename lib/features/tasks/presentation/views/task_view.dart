import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/global/widgets/widgets/loader.dart';
import 'package:my_task/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:my_task/features/tasks/presentation/widgets/task_card.dart';

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
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DropdownButton(
                          onTap: () {},
                          isDense: true,
                          borderRadius: BorderRadius.circular(8),
                          value: 0,
                          items: const [
                            DropdownMenuItem(
                              value: 0,
                              child: Text('All Calls'),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text('My Calls'),
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.taskEntity.length,
                      itemBuilder: (contex, index) {
                        final user = state.taskEntity[index];
                        return TaskCard(
                          username: user.username,
                          location: user.location,
                          department: user.department,
                          assignTo: user.assignTo,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
