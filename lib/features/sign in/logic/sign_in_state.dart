abstract class SignInState<T> {
  const SignInState();
}

class SignInInitial<T> extends SignInState<T> {}

class SignInLoading<T> extends SignInState<T> {}

class SignInSuccess<T> extends SignInState<T> {
  final T data;
  SignInSuccess(this.data);
}

class SignInError<T> extends SignInState<T> {
  final String error;
  SignInError({required this.error});
}