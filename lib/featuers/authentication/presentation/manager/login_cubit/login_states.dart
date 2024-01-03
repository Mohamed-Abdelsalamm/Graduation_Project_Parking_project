import 'package:parking/featuers/authentication/data/models/user_login_response.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String errorMessage;

  const LoginFailure(this.errorMessage);
}

class LoginSuccess extends LoginState {
  final UserLoginResponseModel userLoginResponseModel;
  final String successMessage;

  const LoginSuccess(
      {required this.userLoginResponseModel, required this.successMessage});
}

class LoginObscure extends LoginState {}

class LoginNotObscure extends LoginState {}
