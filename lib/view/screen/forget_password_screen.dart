import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../controller/rotues.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Image.network(
              'https://media.licdn.com/dms/image/C560BAQGo721LuYGevA/company-logo_200_200/0/1676210919351?e=1687392000&v=beta&t=HUoibVJrH9KSMChvzs7CmuvJcaqh3PD5iicy5-XHk2s',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 35,
              width: 30,
            ),
            AnimatedTextKit(
              animatedTexts:   [TypewriterAnimatedText(
                
                  'Send Reset Link to Email!',
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courier',
                  
                ),
                speed: const Duration(
                        milliseconds: 450,
                      ),),
              
              ],
              onTap: (() {}),
      ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Email',
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  TextButton.icon(
                    onPressed: (() {}),
                    icon: const Icon(
                      Icons.read_more,
                      size: 28,
                    ),
                    label: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 35,
                      child: const Text(
                        'Send Reset Link',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  TextButton.icon(
                    onPressed: (() {
                      Navigator.pushNamed(context, MyRoutes.loginScreen);
                    }),
                    icon: const Icon(
                      Icons.home,
                      size: 28,
                    ),
                    label: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 35,
                      child: const Text(
                        'Return Home',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}