import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking/core/utils/app_preferences.dart';
import 'package:parking/featuers/authentication/data/models/user_login_request_model.dart';
import 'package:parking/featuers/authentication/data/models/user_login_response.dart';
import 'package:parking/featuers/authentication/data/repo/auth_repo.dart';
import 'package:parking/featuers/authentication/presentation/manager/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;
  late UserLoginResponseModel userResponse;
  bool isObscureText = true;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var result = await authRepo.loginUser(
        userLoginRequestModel:
            UserLoginRequestModel(mail: email, password: password));
    result.fold((failure) {
      emit(LoginFailure(failure.errMessage));
    }, (userData) async {
      userResponse = userData;
      await AppPreferences.setUserId(userData.id);
      emit(
        LoginSuccess(
          successMessage: "Logged In Successfully!",
          userLoginResponseModel: userData,
        ),
      );
    });
  }

  passwordVisibility() {
    isObscureText = !isObscureText;
    if (isObscureText) {
      emit(LoginObscure());
    } else {
      emit(LoginNotObscure());
    }
  }
}
