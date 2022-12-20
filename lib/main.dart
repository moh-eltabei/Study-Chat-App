import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/sign_in_and_up_page.dart';
import 'package:chat_app/sign_in_page%20copy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/pages/sign_in_page.dart';
import 'package:chat_app/pages/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SignInAndUpPage.id: (context) => const SignInAndUpPage(),
        SignIn.id: (context) => const SignIn(),
        SignInCopy.id: (context) => const SignInCopy(),
        SignUp.id: (context) => const SignUp(),
        ChatPage.id: (context) => ChatPage(),
      },
      initialRoute: SignInAndUpPage.id,
    );
  }
}
