// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:media_probe_app/feature/most_popular_list/model/most_popular_response.dart';

enum MostPopularState { loading, success, failure }

class MostPopularListState extends Equatable {
  final List<MostPopularResult> mostPopularResponse;
  final MostPopularState? mostPopularState;
  const MostPopularListState({this.mostPopularResponse = const [], this.mostPopularState});

  @override
  List<Object?> get props => [mostPopularResponse, mostPopularState];

  MostPopularListState copyWith({
    List<MostPopularResult>? mostPopularResponse,
    MostPopularState? mostPopularState,
  }) {
    return MostPopularListState(
      mostPopularResponse: mostPopularResponse ?? this.mostPopularResponse,
      mostPopularState: mostPopularState ?? this.mostPopularState,
    );
  }
}
