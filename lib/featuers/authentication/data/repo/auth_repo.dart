import 'package:dartz/dartz.dart';
import 'package:parking/core/errors/failures.dart';
import 'package:parking/featuers/authentication/data/models/user_login_request_model.dart';
import 'package:parking/featuers/authentication/data/models/user_login_response.dart';
import 'package:parking/featuers/authentication/data/models/user_register_response.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserLoginResponseModel>> loginUser(
      {required UserLoginRequestModel userLoginRequestModel});
  Future<UserRegisterResponse> registerUser(
      {required String mail,
      required String fullName,
      required String password});
}
