import 'package:quent/Features/home/data/data_source/home_local_data_source.dart';
import 'package:quent/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:quent/Features/home/data/models/brands_response_model.dart';
import 'package:quent/Features/home/domain/repo/home_repo.dart';
import 'package:quent/core/services/remote/api_result.dart';

class HomeRepoImp implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;

  HomeRepoImp({
    required HomeRemoteDataSource homeRemoteDataSource,
    required HomeLocalDataSource homeLocalDataSource,
  }) : _homeRemoteDataSource = homeRemoteDataSource,
       _homeLocalDataSource = homeLocalDataSource;
  @override
  Future<ApiResult<BrandsResponseModel>> fetchBrands({
    int pageNumber = 1,
  }) async {
    try {
      final brandList = await _homeRemoteDataSource.fetchBrands(
        pageNumber: pageNumber,
      );
      return ApiResult.success(brandList);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}
