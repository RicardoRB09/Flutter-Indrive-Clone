import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone/bloc_providers.dart';
import 'package:indriver_clone/presentation/pages/auth/login/login_page.dart';
import 'package:indriver_clone/presentation/pages/auth/register/register_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (context) => const LoginPage(),
          'register': (context) => const RegisterPage(),
        },
      ),
    );
  }
}
