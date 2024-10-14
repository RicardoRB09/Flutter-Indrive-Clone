import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indriver_clone/bloc_providers.dart';
import 'package:indriver_clone/injection.dart';
import 'package:indriver_clone/presentation/pages/auth/login/login_page.dart';
import 'package:indriver_clone/presentation/pages/auth/register/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
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
        builder: FToastBuilder(),
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
