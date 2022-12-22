// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:chat_app/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/contants.dart';
import 'package:chat_app/components/text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../components/custom_elevated_button.dart';
import '../helpers/show_snack_bar.dart';
import 'cubit/chat_cubit/sign_in_cubit/sign_in_cubit.dart';

class SignInPage extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;
  static String id = 'SignInPage';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          isLoading = true;
        } else if (state is SignInSuccess) {
          Navigator.of(context).pushNamed(ChatPage.id);
          isLoading = false;
        } else if (state is SignInFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
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
                            BlocProvider.of<SignInCubit>(context)
                                .signInUserFirebase(
                              email: email!,
                              password: password!,
                            );
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
      ),
    );
  }
}
