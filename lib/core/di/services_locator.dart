import 'package:get_it/get_it.dart';
import 'package:quent/Features/auth/data/data_source/auth_data_source.dart';
import 'package:quent/Features/auth/data/repo/login_repo.dart';
import 'package:quent/Features/auth/data/repo/signup_repo.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';
import 'package:quent/Features/auth/presentation/cubits/phone_verify/phone_verify_cubit.dart';
import 'package:quent/Features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/core/services/local/local_storage_helper.dart';
import 'package:quent/core/services/remote/api_service.dart';
import 'package:quent/core/services/remote/dio_client.dart';

final sl = GetIt.instance;

Future<void> setUpServicesLocator() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  await LocalStorageHelper().init();
  DioClient().init();
  sl.registerSingleton(ApiService());
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => LoginCubit(repo: sl()))
    ..registerFactory(() => SignupCubit(repo: sl()))
    ..registerFactory(() => PhoneVerifyCubit(repo: sl()))
    ..registerFactory(() => ForgotPasswordFlowCubit(repo: sl()))
    ..registerLazySingleton(() => LoginRepo(authDataSource: sl()))
    ..registerLazySingleton(() => AuthDataSource(apiService: sl()))
    ..registerLazySingleton(() => SignupRepo(authDataSource: sl()));
}
