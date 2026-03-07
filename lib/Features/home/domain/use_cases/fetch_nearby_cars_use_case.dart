
import 'package:quent/Features/home/data/models/car_response_model/car_response_model.dart';
import 'package:quent/Features/home/domain/repo/home_repo.dart';
import 'package:quent/core/services/remote/api_result.dart';
import 'package:quent/core/use_cases/use_cases.dart';

class FetchNearbyCarsUseCase extends UseCase<CarResponseModel,int>{

  final HomeRepo homeRepo;
  FetchNearbyCarsUseCase({required this.homeRepo});
  @override
  Future<ApiResult<CarResponseModel>> call([int param=1]) {
    return homeRepo.fetchNearbyCars(pageNumber: param);
  }

}