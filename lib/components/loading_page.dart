import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../contants.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({super.key});
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          title: const Text(
            'Study Chat',
            style: TextStyle(
              fontFamily: 'RobotoMono',
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'Loading...',
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'RobotoMono',
            ),
          ),
        ),
      ),
    );
  }
}
