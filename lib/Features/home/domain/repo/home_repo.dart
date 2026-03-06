import 'package:quent/Features/home/data/models/brands_response_model.dart';
import 'package:quent/core/services/remote/api_result.dart';

abstract class HomeRepo {
  Future<ApiResult<BrandsResponseModel>> fetchBrands({int pageNumber = 1});
}
