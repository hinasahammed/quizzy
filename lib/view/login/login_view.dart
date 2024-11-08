import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizzy/res/components/constants/custom_button.dart';
import 'package:quizzy/res/components/constants/custom_text_formfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final numberController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Welcome back",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Gap(20),
            CustomTextFormfield(
              controller: numberController,
              fieldTitle: "Phone number",
              prefix: const Text("+91"),
            ),
            const Gap(20),
            CustomTextFormfield(
              controller: nameController,
              fieldTitle: "Password",
            ),
            const Gap(50),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: CustomButton(
                onPressed: () {},
                btnText: "Login",
              ),
            ),
            const Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: theme.textTheme.labelLarge!.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Register"),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
