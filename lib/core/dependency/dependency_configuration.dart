import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../constants/service_constants.dart';
import '../../feature/most_popular_list/service/most_popular_list_service.dart';
import '../dio/dio_http_client.dart';

GetIt getIt = GetIt.instance;
void configureInjection() async {
  var baseOptions = BaseOptions(
      baseUrl: ServiceConstants.baseurl,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json; charset=utf-8",
        "X-Requested-With": "XMLHttpRequest",
      },
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json);

  final dio = Dio(baseOptions);
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<DioHttpClient>(() => DioHttpClient(getIt<Dio>()));
  getIt.registerLazySingleton<MostPopularListService>(() => MostPopularListService(getIt<DioHttpClient>()));
}
