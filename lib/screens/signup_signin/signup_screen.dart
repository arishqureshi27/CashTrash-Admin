import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth101/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/customized_button.dart';
import '../../widgets/customized_textfield.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    border: Border.all(color: Colors.black, width: 1),
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
                child: Text("Hello!  Register to get \nStarted",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              CustomizedTextfield(
                myController: _usernameController,
                hintText: "Name",
                isPassword: false,
              ),
              CustomizedTextfield(
                myController: _phonenumberController,
                hintText: "Mobile Number",
                isPassword: false,
              ),
              CustomizedTextfield(
                myController: _emailController,
                hintText: "Email",
                isPassword: false,
              ),
              CustomizedTextfield(
                myController: _passwordController,
                hintText: "Password",
                isPassword: true,
              ),
              CustomizedTextfield(
                myController: _confirmPasswordController,
                hintText: "Confirm Password",
                isPassword: true,
              ),
              CustomizedButton(
                buttonText: "Register",
                buttonColor: Colors.green.shade900,
                textColor: Colors.white,
                onPressed: () async {
                  try {
                    await FirebaseAuthService()
                        .signup(_emailController.text.trim(),
                            _passwordController.text.trim())
                        .then((value) => AlertDialog(
                              title: const Text('Registered Successfully'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green[400]),
                                    child: const Text('OK'))
                              ],
                            ));

                    if (!mounted) return;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  } on FirebaseException catch (e) {
                    debugPrint(e.message);
                  }

                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.height * 0.15,
                      color: Colors.grey,
                    ),
                    const Text("  OR  "),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.height * 0.16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Container(
                    //     height: 50,
                    //     width: 100,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.black, width: 1),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: IconButton(
                    //       icon: const Icon(
                    //         FontAwesomeIcons.facebookF,
                    //         color: Colors.blue,
                    //       ),
                    //       onPressed: () {},
                    //     )),
                    Container(
                      height: 50,
                      //width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                              padding: EdgeInsets.all(10.0),
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
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Already have an account?",
                      style: TextStyle(
                        color: Color(0xff1E232C),
                        fontSize: 15,
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login-page');
                    },
                    child: const Text("  Login Now",
                        style: TextStyle(
                          color: Color(0xff35C2C1),
                          fontSize: 15,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
