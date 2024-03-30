import 'package:flutter/material.dart';
import 'package:my_task/core/global/widgets/custom_button.dart';
import 'package:my_task/features/auth/presentation/view/forgot_view.dart';
import 'package:my_task/features/auth/presentation/widgets/auth_texttfiled.dart';

class LoginView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginView());
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                    'Welcome Back!',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter your registered credentials and login with your account.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AuthTextFormField(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AuthTextFormField(
                    controller: passwordController,
                    hintText: 'Password',
                    obScureText: true,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(ForgotView.route());
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              Column(
                children: [
                  CustomButton(
                    size: size,
                    lable: 'Login',
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
