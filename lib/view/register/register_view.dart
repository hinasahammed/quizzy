import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:quizzy/res/components/constants/custom_button.dart';
import 'package:quizzy/res/components/constants/custom_text_formfield.dart';
import 'package:quizzy/view/login/login_view.dart';
import 'package:quizzy/viewmodel/provider/auth_controller.dart';

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
    final authcontroller = Provider.of<AuthController>(context, listen: false);
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
            Text(
              "Please fill in the form to continue",
              style: theme.textTheme.labelLarge!.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(.5),
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
                onPressed: () {
                  authcontroller.registerUser(
                    context,
                    nameController.text,
                    numberController.text,
                    passwordController.text,
                  );
                },
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ));
                  },
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
