import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizzy/viewmodel/services/splash/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key, required this.splashServices});
  final SplashServices splashServices;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // @override
  // void initState() {
  //   super.initState();
  //   widget.splashServices.isUserLogedin(context);
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Quizzy",
              style: theme.textTheme.headlineLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Gap(50),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
