import 'package:flutter/material.dart';
import 'package:my_task/core/global/widgets/custom_button.dart';
import 'package:my_task/features/auth/presentation/widgets/auth_texttfiled.dart';

class ForgotView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const ForgotView());
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.all(size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reset password!',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter your registered email adderess, we will send you a reset link.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              AuthTextFormField(
                controller: emailController,
                hintText: 'Email',
              ),
              Column(
                children: [
                  CustomButton(
                    size: size,
                    lable: 'Send Email',
                    lableColor: Theme.of(context).colorScheme.onSurface,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    size: size,
                    lable: 'Back',
                    lableColor: Theme.of(context).colorScheme.inversePrimary,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
