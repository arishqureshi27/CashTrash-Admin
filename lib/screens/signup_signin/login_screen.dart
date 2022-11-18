import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../../provider/login_auth_provider.dart';
import '../../widgets/customized_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/firebase_auth_service.dart';
import '../../widgets/customized_button.dart';
import './forgot_passwor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    LoginAuthProvider loginAuthProvider =
        Provider.of<LoginAuthProvider>(context);

    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade900, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_sharp),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Welcome Back Admin!\nGlad to see you again",
                    style: TextStyle(
                      color: Color(0xFF09B1EC),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              CustomizedTextfield(
                myController: _emailController,
                hintText: "Enter your Email",
                isPassword: false,
              ),
              CustomizedTextfield(
                myController: _passwordController,
                hintText: "Enter your Password",
                isPassword: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: const Text("Forgot Password?",
                        style: TextStyle(
                          color: Color(0xff6A707C),
                          fontSize: 15,
                        )),
                  ),
                ),
              ),

              // Login Button
              loginAuthProvider.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomizedButton(
                      buttonText: "Login",
                      buttonColor: const Color(0xFF09B1EC),
                      textColor: Colors.white,
                      onPressed: () {
                        loginAuthProvider.loginValidation(
                          email: _emailController,
                          password: _passwordController,
                          context: context,
                        );
                      },

                      // onPressed: () async {
                      //   //  The else part is not working in the video because we have
                      //   //  enclosed it in the try catch block. Once we have error in
                      //   // login the firebase exception is thrown and the codeblock after that
                      //   // error is skiped and code of catch block is executed.
                      //   // if we want our else part to be executed we need to get rid from
                      //   // this try catch or add that code in catch block.

                      //   try {
                      //     await FirebaseAuthService().login(
                      //         _emailController.text.trim(),
                      //         _passwordController.text.trim());
                      //     if (FirebaseAuth.instance.currentUser != null) {
                      //       if (!mounted) return;
                      //       Navigator.pushNamed(context, '/dashboard');
                      //     }
                      //   } on FirebaseException catch (e) {
                      //     debugPrint("error is ${e.message}");

                      //     showDialog(
                      //         context: context,
                      //         builder: (context) => AlertDialog(
                      //                 shape: RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.circular(16),
                      //                 ),
                      //                 title: const Text(
                      //                   "Invalid Username or Password",
                      //                 ),
                      //                 content: const Text(
                      //                   'Please make sure that username and password is correct',
                      //                 ),
                      //                 actions: [
                      //                   Center(
                      //                     child: ElevatedButton(
                      //                       onPressed: () {
                      //                         Navigator.pop(context);
                      //                       },
                      //                       style: ElevatedButton.styleFrom(
                      //                           backgroundColor: Colors.green[800]),
                      //                       child: const Text('OK'),
                      //                     ),
                      //                   )
                      //                 ]));
                      //   }

                      //   // Navigator.push(context,
                      //   //     MaterialPageRoute(builder: (_) => const LoginScreen()));
                      // },
                    ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.height * 0.15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("   OR  "),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.height * 0.18,
                    color: Colors.grey,
                  ),
                ],
              ),

              // WhiteSpace
              const SizedBox(height: 20),

              // Sign in With Google Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 290,
                    child: OutlinedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/google.png',
                            width: 50,
                            height: 50,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                'CONTINUE WITH GOOGLE',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () async {
                        try {
                          await FirebaseAuthService().logininwithgoogle();

                          if (FirebaseAuth.instance.currentUser != null) {
                            if (!mounted) return;

                            Navigator.pushNamed(
                              context,
                              '/dashboard',
                            );
                          } else {
                            throw Exception("Error");
                          }
                        } on PlatformException catch (_) {
                          print("Exception");
                          rethrow;
                        }
                      },
                    ),

                    // Container(
                    //     height: 50,
                    //     width: 100,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.black, width: 1),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: IconButton(
                    //       icon: const Icon(
                    //         FontAwesomeIcons.apple,
                    //         // color: Colors.blue,
                    //       ),
                    //       onPressed: () {},
                    //     ))
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ",
                      style: TextStyle(
                        color: Color(0xff1E232C),
                        fontSize: 15,
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/register-page');
                    },
                    child: const Text("Register Now",
                        style: TextStyle(
                          color: Color(0xff35C2C1),
                          fontSize: 15,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
