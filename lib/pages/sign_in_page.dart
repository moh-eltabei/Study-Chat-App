// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:chat_app/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/contants.dart';
import 'package:chat_app/components/text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../components/custom_elevated_button.dart';
import '../helpers/show_snack_bar.dart';
import '../sign_up_page copy.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static String id = 'SignInPage';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              color: kPrimaryColor,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 150),
                    height: 250,
                    child: Image.asset(
                      'assets/images/chat_2.png',
                    ),
                    //
                  ),
                  Expanded(
                    child: Container(
                      color: kThirdColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(32, 150, 32, 0),
              decoration: const BoxDecoration(
                color: Color(0xfff9f9f9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 30,
                        right: 30,
                        bottom: 30,
                      ),
                      child: CustomTextFormField(
                        hintText: 'email',
                        onChanged: (data) => email = data,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 50),
                      child: CustomTextFormField(
                        obscureText: true,
                        hintText: 'password',
                        onChanged: (data) => password = data,
                      ),
                    ),
                    CustomElevatedButton(
                      color: kFifthColor,
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
                    const SizedBox(
                      height: 8,
                    ),
                    const Center(
                      child: Text(
                        'FORGOT PASSWORD',
                        style: TextStyle(
                            color: kForthColor,
                            fontFamily: 'RobotoMono',
                            fontSize: 14,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signInUserFirebase() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}