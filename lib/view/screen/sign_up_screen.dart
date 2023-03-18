import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:upload_image/view/widget/rounded_widget.dart';


import '../../controller/firebase_controller.dart';
import '../../controller/rotues.dart';

// TODO: Add the TextStyle in main dart

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirbaseController _firbaseController = FirbaseController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return 
      SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://media.licdn.com/dms/image/C560BAQGo721LuYGevA/company-logo_200_200/0/1676210919351?e=1687392000&v=beta&t=HUoibVJrH9KSMChvzs7CmuvJcaqh3PD5iicy5-XHk2s',
                  fit: BoxFit.cover,
                ),
                
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Create Your Account!',
                          textStyle: const TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.w500,
                          ),
                          speed: const Duration(
                            milliseconds: 450,
                          ),),
                    ],
                    isRepeatingAnimation: true,
                    totalRepeatCount: 2,
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _userNameController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Enter Your Full Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: 'Enter Your Email/Username',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: 'Enter Your Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      RoundedButtonWidget(
                        onpressed: (() async {

                          final result = await _firbaseController.signUpWithEmailAndPassword(
                            _emailController.text,
                            _passwordController.text,
                          );
                          // Implement the scaffold messager 
                          if (result == "Successful") {
                            Navigator.pushNamed(
                              context,
                              MyRoutes.uploadScreen,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(result),
                              ),
                            );
                          }
                        }),
                        buttonText: 
                          'Sign Up',
                          width: MediaQuery.of(context).size.width * 0.8,
                          
                      ),
                      Row(
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                            onPressed: (() {
                              Navigator.pushNamed(
                                context,
                                MyRoutes.loginScreen,
                              );
                            }),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      
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