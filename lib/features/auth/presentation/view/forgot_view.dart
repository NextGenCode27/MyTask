import 'package:flutter/material.dart';
import 'package:my_task/core/global/widgets/buttons/custom_elevated_button.dart';
import 'package:my_task/features/auth/presentation/widgets/auth_texttfiled.dart';

class ForgotView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const ForgotView());
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 30,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter your registered email adderess, we will send you a reset link.',
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.7),
                      fontSize: 16,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: AuthTextFormField(
                  controller: emailController,
                  hintText: 'Email',
                ),
              ),
              Column(
                children: [
                  CustomElevatedButton(
                    size: size,
                    lable: 'Send Email',
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomElevatedButton(
                    size: size,
                    lable: 'Back',
                    lableColor: Theme.of(context).colorScheme.background,
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
