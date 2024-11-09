import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:quizzy/res/components/constants/custom_button.dart';
import 'package:quizzy/res/components/constants/custom_text_formfield.dart';
import 'package:quizzy/view/register/register_view.dart';
import 'package:quizzy/viewmodel/provider/auth_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authcontroller = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              Text(
                "Please sigin to your account",
                style: theme.textTheme.labelLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(.5),
                ),
              ),
              const Gap(40),
              CustomTextFormfield(
                controller: numberController,
                keyboardType: TextInputType.number,
                validator: (phonenumber) {
                  if (phonenumber == null || phonenumber.isEmpty) {
                    return "Enter phone number";
                  }
                  if (phonenumber.length < 10) {
                    return "Enter valid phonenumber";
                  }
                  return null;
                },
                fieldTitle: "Phone number",
                prefix: const Text("+91"),
              ),
              const Gap(20),
              CustomTextFormfield(
                controller: passwordController,
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return "Enter password";
                  }
                  if (password.length < 6) {
                    return "Password too short";
                  }
                  return null;
                },
                fieldTitle: "Password",
              ),
              const Gap(50),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {
                    authcontroller.login(
                      context,
                      numberController.text,
                      passwordController.text,
                    );
                  },
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterView(),
                          ));
                    },
                    child: const Text("Register"),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    numberController.dispose();
    passwordController.dispose();
  }
}
