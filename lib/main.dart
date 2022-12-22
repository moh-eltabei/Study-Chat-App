import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/cubit/chat_cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_app/pages/sign_in_and_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/pages/sign_in_page.dart';
import 'package:chat_app/pages/sign_up_page.dart';

import 'pages/cubit/chat_cubit/sign_in_cubit/sign_in_cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignInCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SignInAndUpPage.id: (context) => const SignInAndUpPage(),
          SignInPage.id: (context) => SignInPage(),
          SignUpPage.id: (context) => SignUpPage(),
          ChatPage.id: (context) => ChatPage(),
        },
        initialRoute: SignInAndUpPage.id,
      ),
    );
  }
}
