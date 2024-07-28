import 'package:deneme/Screens/Sign-Up/signUp-Screen.dart';
import 'package:deneme/Screens/login/forget-pssword/forget_password_screen.dart';
import 'package:deneme/Screens/login/forget-pssword/new_password_screen.dart';
import 'package:deneme/Screens/login/login_screen.dart';
import 'package:deneme/cahce/cahce_helper.dart';
import 'package:deneme/core/api/dio_consumer.dart';
import 'package:deneme/cubit/user_cubit.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(DioConsumer(dio: Dio())),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/SignUp': (context) => const SignUpScreen(),
        '/ForgetPasswordScreen': (context) => ForgetPasswordScreen(),
        '/NewPassworsScreen': (context) => NewPasswordScreen(),
      },
    );
  }
}
