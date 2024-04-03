import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/global/utils/snackbar.dart';
import 'package:my_task/core/global/widgets/buttons/custom_elevated_icon_button.dart';
import 'package:my_task/core/global/widgets/widgets/loader.dart';
import 'package:my_task/features/home/presentation/views/home_view.dart';
import 'package:my_task/features/tasks/domain/usecase/add_task_usecase.dart';
import 'package:my_task/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:my_task/features/tasks/presentation/widgets/add_call_textfield.dart';

class AddTaskView extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddTaskView());
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController problemeReportedController =
      TextEditingController();
  final TextEditingController assignToController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    locationController.dispose();
    departmentController.dispose();
    problemeReportedController.dispose();
    assignToController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        title: Text(
          'Add Call',
          style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              letterSpacing: 2.0),
        ),
      ),
      body: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is TaskSuccess) {
            Navigator.of(context)
                .pushAndRemoveUntil(HomeView.route(), (route) => false);
          }

          if (state is TaskFailed) {
            showSnackbar(context: context, content: state.message);
          }
        },
        builder: (context, state) {
          if (state is TaskLoading) {
            return const Loader();
          }
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              height: size.height,
              width: size.width,
              padding: EdgeInsets.all(size.width * 0.05),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AddCallTextFormField(
                          controller: usernameController,
                          hintText: 'Username',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AddCallTextFormField(
                          controller: locationController,
                          hintText: 'Location',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AddCallTextFormField(
                          controller: departmentController,
                          hintText: 'Department',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AddCallTextFormField(
                          controller: problemeReportedController,
                          hintText: 'Problem Reported',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AddCallTextFormField(
                          controller: assignToController,
                          hintText: 'Assign To',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedIconButton(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          lable: 'Cancel',
                          icon: Icons.clear,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CustomElevatedIconButton(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          lable: 'Save',
                          icon: Icons.save,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<TaskBloc>().add(
                                    AddTaskEvent(
                                      addTaskParams: AddTaskParams(
                                        username:
                                            usernameController.text.trim(),
                                        location:
                                            locationController.text.trim(),
                                        department:
                                            departmentController.text.trim(),
                                        problemReported:
                                            problemeReportedController.text
                                                .trim(),
                                        assignTo:
                                            assignToController.text.trim(),
                                      ),
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
