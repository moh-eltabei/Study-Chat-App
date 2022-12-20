import 'package:chat_app/contants.dart';
import 'package:chat_app/pages/sign_in_page.dart';
import 'package:chat_app/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import '../components/custom_elevated_button.dart';
import '../components/custom_outlined_button.dart';

class SignInAndUpPage extends StatelessWidget {
  const SignInAndUpPage({super.key});
  static String id = 'SignInAndUpPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
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
            child: Column(
              children: [
                const Spacer(
                  flex: 1,
                ),
                CustomElevatedButton(
                  text: 'SIGN IN',
                  onTap: (() {
                    Navigator.pushNamed(
                      context,
                      SignIn.id,
                    );
                  }),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomOutlinedButton(
                  text: 'SIGN UP',
                  onTap: (() {
                    Navigator.pushNamed(
                      context,
                      SignUp.id,
                    );
                  }),
                ),
                const Spacer(
                  flex: 2,
                ),
                Container(
                  height: 5,
                  width: 120,
                  color: const Color(0xffe8ebef),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
