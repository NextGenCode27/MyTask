import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/global/utils/snackbar.dart';
import 'package:my_task/core/global/widgets/buttons/custom_elevated_button.dart';
import 'package:my_task/core/global/widgets/widgets/loader.dart';
import 'package:my_task/features/auth/domain/usecase/login_usecase.dart';
import 'package:my_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_task/features/auth/presentation/view/forgot_view.dart';
import 'package:my_task/features/auth/presentation/widgets/auth_texttfiled.dart';
import 'package:my_task/features/home/presentation/views/home_view.dart';

class LoginView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginView());
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
                HomeView.route(state.user), (route) => false);
          }
          if (state is AuthFailed) {
            showSnackbar(context: context, content: state.message);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Loader();
          }
          return SingleChildScrollView(
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
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 30,
                          letterSpacing: 2.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Enter your registered credentials and login with your account.',
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
                    child: Column(
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
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.7),
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      CustomElevatedButton(
                        size: size,
                        lable: 'Login',
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthLoginEvent(
                                    params: LoginParams(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  ),
                                );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButton(
                        size: size,
                        lable: 'Back',
                        lableColor: Theme.of(context).colorScheme.background,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
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
