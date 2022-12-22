import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signInUserFirebase(
      {required String email, required String password}) async {
    try {
      emit(SignInLoading());

      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(SignInSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(SignInFailure(errMessage: 'User not Found'));
      } else if (ex.code == 'wrong-password') {
        emit(SignInFailure(errMessage: 'Wrong Password'));
      }
    } on Exception catch (e) {
      emit(SignInFailure(errMessage: 'Something went wrong'));
    }
  }
}
