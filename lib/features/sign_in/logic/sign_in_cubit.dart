import 'package:engipedia/features/sign_in/data/sign_in_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/sign_in_request_body.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInRepo _signInRepo;

  SignInCubit(this._signInRepo) : super(const SignInInitial());

  // Controllers لسهولة الوصول للداتا من الـ UI
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

void emitSignInStates() async {
    emit(const SignInLoading());
    
    try {
      final response = await _signInRepo.login(
        SignInRequestBody(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      // لو وصلنا هنا يبقى الطلب نجح
      emit(SignInSuccess(response));
    } catch (error) {
      // لو حصل أي خطأ (سواء في الشبكة أو في تحويل البيانات) هيظهر هنا
      emit(SignInError(error: error.toString()));
    }
  }
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}