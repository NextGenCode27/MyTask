import 'package:flutter/material.dart';
import 'package:my_task/core/global_features/themes/presentation/theme/colors.dart';
import 'package:my_task/features/tasks/presentation/views/add_task_view.dart';

class AddTaskFloatingButton extends StatelessWidget {
  const AddTaskFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.of(context).push(
          AddTaskView.route(),
        );
      },
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      icon: const Icon(
        Icons.add,
        color: whiteColor,
      ),
      label: const Text(
        'Task',
        style: TextStyle(
          color: whiteColor,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}
