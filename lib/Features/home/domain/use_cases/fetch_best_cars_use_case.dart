
import 'package:quent/Features/home/data/models/car_response_model/car_response_model.dart';
import 'package:quent/Features/home/domain/repo/home_repo.dart';
import 'package:quent/core/services/remote/api_result.dart';
import 'package:quent/core/use_cases/use_cases.dart';

class FetchBestCarsUseCase extends UseCase<CarResponseModel, int> {
  final HomeRepo _homeRepo;

  FetchBestCarsUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;
  @override
  Future<ApiResult<CarResponseModel>> call([int param = 1]) async {
    return  _homeRepo.fetchBestCars(pageNumber: param);


  }
}
