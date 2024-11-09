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
  final _fomrKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authcontroller = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _fomrKey,
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
                validator: (name) {
                  if (name == null || name.isEmpty) {
                    return "Enter Username";
                  }
                  if (name.length < 3) {
                    return "Too Short";
                  }
                  return null;
                },
                fieldTitle: "Name",
              ),
              const Gap(20),
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
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    numberController.dispose();
    passwordController.dispose();
  }
}
