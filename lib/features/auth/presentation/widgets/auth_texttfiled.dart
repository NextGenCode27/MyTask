import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obScureText = false,
  });

  final String hintText;
  final TextEditingController controller;
  final bool obScureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Theme.of(context).colorScheme.onBackground,
      decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
          )),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      obscureText: obScureText,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        letterSpacing: 2.0,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintText can not be empty.';
        }
        return null;
      },
    );
  }
}
