import 'package:bloc/bloc.dart';
import 'package:chat_app/helpers/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUpUserFirebase(
      {required String email, required String password}) async {
    try {
      emit(SignUpLoading());

      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(SignUpFailure(errMessage: 'Weak Password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(SignUpFailure(errMessage: 'email already exist'));
      }
    } on Exception catch (e) {
      emit(SignUpFailure(errMessage: 'somwthing went wrong'));
    }
  }
}
