import 'package:get_it/get_it.dart';
import 'package:quent/Features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:quent/Features/auth/data/repo/auth_repo_imp.dart';
import 'package:quent/Features/auth/domain/repo/auth_repo.dart';
import 'package:quent/Features/auth/presentation/cubits/forgot_password_flow/forgot_password_flow_cubit.dart';
import 'package:quent/Features/auth/presentation/cubits/phone_verify/phone_verify_cubit.dart';
import 'package:quent/Features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/Features/home/data/data_source/home_local_data_source.dart';
import 'package:quent/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:quent/Features/home/data/repos/home_repo_imp.dart';
import 'package:quent/Features/home/domain/repo/home_repo.dart';
import 'package:quent/Features/home/domain/use_cases/fetch_brands_use_case.dart';
import 'package:quent/core/services/local/local_storage_helper.dart';
import 'package:quent/core/services/remote/api_service.dart';
import 'package:quent/core/services/remote/dio_client.dart';

final sl = GetIt.instance;

Future<void> setUpServicesLocator() async {
  await _initCore();
  await _initAuth();
  await _initHome();
}

Future<void> _initCore() async {
  final localStorage = LocalStorageHelper();
  await localStorage.init();
  sl.registerSingleton<LocalStorageHelper>(localStorage);

  final dioClient = DioClient();
  dioClient.init();
  sl.registerSingleton<DioClient>(dioClient);

  sl.registerLazySingleton<ApiService>(() => ApiService(dio: dioClient.dio));
}

Future<void> _initAuth() async {
  sl
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(apiService: sl()),
    )
    ..registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(authRemoteDataSource: sl()),
    )
    ..registerFactory(() => LoginCubit(authRepo: sl()))
    ..registerFactory(() => SignupCubit(authRepo: sl()))
    ..registerFactory(() => PhoneVerifyCubit(authRepo: sl()))
    ..registerFactory(() => ForgotPasswordFlowCubit(authRepo: sl()));
}

Future<void> _initHome() async {
  sl
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImp(apiService: sl<ApiService>()),
    )
    ..registerLazySingleton<HomeLocalDataSource>(() => HomeLocalDataSourceImp())
    ..registerLazySingleton<HomeRepo>(
      () => HomeRepoImp(homeRemoteDataSource: sl(), homeLocalDataSource: sl()),
    )
    ..registerLazySingleton<FetchBrandsUseCase>(
      () => FetchBrandsUseCase(homeRepo: sl()),
    );
}
