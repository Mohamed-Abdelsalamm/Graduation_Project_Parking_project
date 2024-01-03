import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parking/core/errors/failures.dart';
import 'package:parking/core/utils/api_service.dart';
import 'package:parking/featuers/authentication/data/models/user_login_request_model.dart';
import 'package:parking/featuers/authentication/data/models/user_login_response.dart';
import 'package:parking/featuers/authentication/data/models/user_register_response.dart';
import 'package:parking/featuers/authentication/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UserLoginResponseModel>> loginUser(
      {required UserLoginRequestModel userLoginRequestModel}) async {
    try {
      print("----------> Step1");
      var data = await apiService.get(
        endPoint: "userLogin/",
        data: userLoginRequestModel.toJson(),
      );
      print("----------> Step2");
      UserLoginResponseModel userLoginResponseModel =
          UserLoginResponseModel.fromJson(data);
      print("----------> Step3");
      return right(userLoginResponseModel);
    } catch (e) {
      print("----------> Step4");
      print("----------> ${e.toString()}");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<UserRegisterResponse> registerUser(
      {required String mail,
      required String fullName,
      required String password}) async {
    return UserRegisterResponse(
      mail: "mail",
      fullName: "fullName",
    );
  }
}
