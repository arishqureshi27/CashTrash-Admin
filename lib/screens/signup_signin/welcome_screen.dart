import 'package:firebase_auth101/widgets/customized_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("./assets/ct_bgAdmin.png"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomizedButton(
                buttonText: "Login as Admin",
                buttonColor: const Color(0xFF09B1EC),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/login-page');
                },
              ),
              CustomizedButton(
                buttonText: "Register",
                buttonColor: Colors.white,
                textColor: const Color(0xFF09B1EC),
                onPressed: () {
                  Navigator.pushNamed(context, '/register-page');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
