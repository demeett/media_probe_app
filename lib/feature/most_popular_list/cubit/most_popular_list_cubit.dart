import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_probe_app/core/base/app_result.dart';
import 'package:media_probe_app/core/dependency/dependency_configuration.dart';
import 'package:media_probe_app/feature/most_popular_list/cubit/most_popular_list_state.dart';
import 'package:media_probe_app/feature/most_popular_list/model/most_popular_response.dart';
import 'package:media_probe_app/feature/most_popular_list/service/most_popular_list_service.dart';

class MostPopularListCubit extends Cubit<MostPopularListState> {
  MostPopularListCubit() : super(const MostPopularListState());

  final MostPopularListService mostPopularListService = getIt.get<MostPopularListService>();

  Future<void> getMostPopular() async {
    emit(state.copyWith(mostPopularState: MostPopularState.loading));
    AppResult<MostPopularResponse> response = await mostPopularListService.getMostPopuler();
    if (response.isSucces) {
      final result = response.data!.results;
      result?.sort((a, b) => DateTime.parse(b.publishedDate ?? "").compareTo(DateTime.parse(a.publishedDate ?? "")));

      emit(state.copyWith(mostPopularState: MostPopularState.success, mostPopularResponse: result));
    } else {
      emit(state.copyWith(
        mostPopularState: MostPopularState.failure,
      ));
    }
  }
}
