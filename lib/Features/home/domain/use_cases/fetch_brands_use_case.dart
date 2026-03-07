import 'package:quent/Features/home/data/models/brands_response_model/brands_response_model.dart';
import 'package:quent/Features/home/domain/repo/home_repo.dart';
import 'package:quent/core/services/remote/api_result.dart';
import 'package:quent/core/use_cases/use_cases.dart';

class FetchBrandsUseCase extends UseCase<BrandsResponseModel, int> {
  final HomeRepo _homeRepo;

  FetchBrandsUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;
  @override
  Future<ApiResult<BrandsResponseModel>> call([int param = 1])  {
    return  _homeRepo.fetchBrands(pageNumber: param);
   
  }
}
