import'package:flutter/material.dart';

import 'controller/rotues.dart';
import 'view/screen/forget_password_screen.dart';
import 'view/screen/login_screen.dart';
import 'view/screen/sign_up_screen.dart';
import 'view/screen/upload_screen.dart';

void  main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        MyRoutes.homeScreen: (context) => UploadScreen(),
        MyRoutes.loginScreen: (context) => LoginScreen(),
        MyRoutes.signUp: (context) => SignUp(),
        MyRoutes.forgotPassword: (context) => ForgotPassword(),
      }
    );
    
  }
}