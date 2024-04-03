import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/global/widgets/widgets/loader.dart';
import 'package:my_task/core/global_features/themes/presentation/theme/colors.dart';
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
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          'All Calls',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.taskEntity.length,
                      itemBuilder: (contex, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 20),
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                state.taskEntity[index].username,
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.taskEntity[index].location,
                                        style: TextStyle(
                                          color: whiteColor.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                      Text(
                                        state.taskEntity[index].department,
                                        style: TextStyle(
                                          color: whiteColor.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Assign To',
                                        style: TextStyle(
                                          color: whiteColor.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                      Text(
                                        state.taskEntity[index].assignTo,
                                        style: TextStyle(
                                          color: whiteColor.withOpacity(0.8),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
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
