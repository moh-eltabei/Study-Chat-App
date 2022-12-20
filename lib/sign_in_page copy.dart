// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/contants.dart';
import 'package:chat_app/components/text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/custom_elevated_button.dart';
import '../helpers/show_snack_bar.dart';

class SignInCopy extends StatefulWidget {
  const SignInCopy({super.key});

  static String id = 'SignInPageCopy';

  @override
  State<SignInCopy> createState() => _SignInCopyState();
}

GlobalKey<FormState> formKey = GlobalKey();

class _SignInCopyState extends State<SignInCopy> {
  // GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  kLogo,
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'ToDo Chat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 8),
                  child: CustomTextFormField(
                    hintText: 'Email',
                    onChanged: (data) => email = data,
                  ),
                ),
                CustomTextFormField(
                  obscureText: true,
                  hintText: 'Password',
                  onChanged: (data) => password = data,
                ),
                CustomElevatedButton(
                  text: 'Sign In',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await signInUserFirebase();
                        Navigator.pushNamed(
                          context,
                          ChatPage.id,
                          arguments: email,
                        );
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'user-not-found') {
                          showSnackBar(
                              context, 'No user found for that email.');
                        } else if (ex.code == 'wrong-password') {
                          showSnackBar(context, 'Wrong password.');
                        }
                      } catch (e) {
                        print(e);
                      }
                      isLoading = false;
                      setState(() {});
                    } else {}
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: (() {
                        Navigator.pushNamed(context, SignUp.id);
                      }),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xffc7ede6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInUserFirebase() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
