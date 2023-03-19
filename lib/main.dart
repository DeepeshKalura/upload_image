import'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/rotues.dart';
import 'firebase_options.dart';
import 'view/screen/forget_password_screen.dart';
import 'view/screen/login_screen.dart';
import 'view/screen/sign_up_screen.dart';
import 'view/screen/upload_screen.dart';

Future<void>  main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
 options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          titleSmall: GoogleFonts.adventPro(
            fontSize: 12
          ),
          titleMedium: GoogleFonts.openSans(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: GoogleFonts.openSans(
            fontSize: 30,
            color: Colors.red,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
          bodySmall: GoogleFonts.aclonica(
            fontSize: 12,
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,

          ),
          bodyMedium: GoogleFonts.aclonica(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w700,

          ),
          displaySmall: GoogleFonts.openSans(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          
        ),
        
      ),
      initialRoute: '/',

      routes: {
        MyRoutes.uploadScreen: (context) => const UploadScreen(),
        MyRoutes.loginScreen: (context) => const LoginScreen(),
        MyRoutes.signUp: (context) => const SignUp(),
        MyRoutes.forgotPassword: (context) => const ForgotPassword(),
        MyRoutes.checker: (context) => const Checker(),
      }
    );
    
  }
}

class Checker extends StatelessWidget {
  const Checker({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return const UploadScreen();
        } else {
          return const LoginScreen();
        }
      },);
  }
}