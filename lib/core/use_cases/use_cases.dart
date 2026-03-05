import 'package:quent/core/services/remote/api_result.dart';

abstract class UseCase<T, Param> {
  Future<ApiResult< T>> call([Param param]);
}

class NoParam {}
