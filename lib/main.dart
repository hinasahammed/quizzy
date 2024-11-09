import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzy/repository/authRepository/auth/local_auth_repository.dart';
import 'package:quizzy/repository/authRepository/auth_repository.dart';
import 'package:quizzy/repository/storageRepository/local/local_storage_repository.dart';
import 'package:quizzy/view/splash/splash_view.dart';
import 'package:quizzy/viewmodel/provider/auth_controller.dart';
import 'package:quizzy/viewmodel/services/splash/splash_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: preferences));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LocalStorageRepository localStorageRepository;
  late AuthRepository authRepository;
  late SplashServices splashServices;

  @override
  void initState() {
    super.initState();
    localStorageRepository = LocalStorageRepository(
      sharedPreferences: widget.sharedPreferences,
    );
    authRepository = LocalAuthRepository(
      localStorageRepository: localStorageRepository,
    );
    splashServices = SplashServices(storageRepository: localStorageRepository);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthController(authRepository: authRepository),
      child: MaterialApp(
        title: 'Quizzy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff00008B),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        home: SplashView(
          splashServices: splashServices,
        ),
      ),
    );
  }
}
