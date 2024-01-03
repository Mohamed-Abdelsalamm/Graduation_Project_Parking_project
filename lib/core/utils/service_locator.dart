import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:parking/core/utils/api_service.dart';
import 'package:parking/featuers/authentication/data/repo/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(getIt.get<ApiService>()),
  );
}
