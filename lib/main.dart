import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth101/firebase_options.dart';
import 'package:firebase_auth101/screens/dashboard_screens/dashboard.dart';
import 'package:firebase_auth101/screens/signup_signin/signup_screen.dart';
import 'package:firebase_auth101/screens/signup_signin/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'provider/login_auth_provider.dart';
import 'provider/signup_auth_provider.dart';
import 'screens/signup_signin/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginAuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Admin App',
        theme: ThemeData(
          textTheme: GoogleFonts.urbanistTextTheme(),
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/welcome-page': (context) => const WelcomeScreen(),
          '/login-page': (context) => const LoginScreen(),
          '/register-page': (context) => const SignUpScreen(),
          '/dashboard': (context) => const Dashboard(),
        },
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Dashboard();
            } else {
              return const WelcomeScreen();
            }
          },
        ),
      ),
    );
  }
}
