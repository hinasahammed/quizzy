import 'package:flutter/material.dart';
import 'package:quizzy/view/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff00008B),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}
