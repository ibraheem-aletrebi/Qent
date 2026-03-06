import 'package:quent/Features/home/data/models/brands_response_model.dart';
import 'package:quent/core/constants/api_end_points.dart';
import 'package:quent/core/services/remote/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<BrandsResponseModel> fetchBrands({int pageNumber = 1});
}

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  final ApiService _apiService;
  HomeRemoteDataSourceImp({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<BrandsResponseModel> fetchBrands({int pageNumber = 1}) async {
    final response = await _apiService.get(
      ApiEndPoints.brands,
      queryParameters: {'page': pageNumber},
    );
  return BrandsResponseModel.fromJson(response.data);  
  }
}
