abstract class SignInState {
  const SignInState();
}

class SignInInitial extends SignInState {
  const SignInInitial();
}

class SignInLoading extends SignInState {
  const SignInLoading();
}

class SignInSuccess<T> extends SignInState {
  final T data;
  const SignInSuccess(this.data);
}

class SignInError extends SignInState {
  final String error;
  const SignInError({required this.error});
}