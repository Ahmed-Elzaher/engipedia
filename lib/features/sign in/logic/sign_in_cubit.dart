import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  void emitSignInStates() async {
    emit(SignInLoading());
    
    // محاكاة لطلب الـ API (هنرجع نعدلها لما نربط الـ Repo)
    await Future.delayed(const Duration(seconds: 2));
    
    emit(SignInSuccess("أهلاً بك يا بطل في Engipedia"));
  }
}