import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:upload_image/view/widget/rounded_widget.dart';

import '../../controller/firebase_controller.dart';
import '../../controller/rotues.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final FirbaseController _firebaseController = FirbaseController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Image.network(
                  'https://media.licdn.com/dms/image/C560BAQGo721LuYGevA/company-logo_200_200/0/1676210919351?e=1687392000&v=beta&t=HUoibVJrH9KSMChvzs7CmuvJcaqh3PD5iicy5-XHk2s',
                  fit: BoxFit.cover,
                ),
              ),
              
              AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Send Reset Link!',
                        textStyle: Theme.of(context).textTheme.titleLarge,
                        speed: const Duration(
                          milliseconds: 450,
                        ),),
                  ],
                  
                  isRepeatingAnimation: true,
                  totalRepeatCount: 6,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    RoundedButtonWidget(buttonText: 'Reset Link', width: MediaQuery.of(context).size.width * 0.8, onpressed: () async {
                     final result = await _firebaseController.forgotPassword(_emailController.text);
                     if(result == 'Successful'){
                      
                       ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                           content: Text(result),
                           duration: const Duration(seconds: 2),
                         ),
                       );
                        Navigator.pushNamed(context, MyRoutes.loginScreen);
                     
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                           content: Text(result),
                         ),
                       );
                    }}),
                    RoundedButtonWidget(buttonText: 'LogIn', width: MediaQuery.of(context).size.width * 0.8, onpressed: () {
                      Navigator.pushNamed(context, MyRoutes.loginScreen);
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}