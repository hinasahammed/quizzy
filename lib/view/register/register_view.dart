import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizzy/res/components/constants/custom_button.dart';
import 'package:quizzy/res/components/constants/custom_text_formfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
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
              "Create acccount",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Gap(40),
            CustomTextFormfield(
              controller: nameController,
              fieldTitle: "Name",
            ),
            const Gap(20),
            CustomTextFormfield(
              controller: numberController,
              fieldTitle: "Phone number",
              prefix: const Text("+91"),
            ),
            const Gap(20),
            CustomTextFormfield(
              controller: passwordController,
              fieldTitle: "Password",
            ),
            const Gap(50),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: CustomButton(
                onPressed: () {},
                btnText: "Create account",
              ),
            ),
            const Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: theme.textTheme.labelLarge!.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Login"),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
