import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe_app/core/dependency/dependency_configuration.dart';
import 'package:media_probe_app/feature/most_popular_list/cubit/most_popular_list_cubit.dart';
import 'package:media_probe_app/feature/most_popular_list/cubit/most_popular_list_state.dart';
import 'package:media_probe_app/feature/most_popular_list/model/most_popular_response.dart';
import 'package:mockito/mockito.dart';
import 'package:media_probe_app/feature/most_popular_list/service/most_popular_list_service.dart';

class MockMostPopularListService extends Mock implements MostPopularListService {}

void main() {
  configureInjection();
  group('MostPopularListCubit Test', () {
    // Test için mock servis ve istenen sonuçlar oluşturuluyor
    final mockMostPopularListService = MockMostPopularListService();
    const mockMostPopularResponse = MostPopularResponse(
      results: [
        MostPopularResult(
          title: 'Test Article 1',
          publishedDate: '2023-07-22T12:00:00Z',
          abstract: 'This is a test article',
          media: [],
        ),
        MostPopularResult(
          title: 'Test Article 2',
          publishedDate: '2023-07-21T12:00:00Z',
          abstract: 'Another test article',
          media: [],
        ),
      ],
    );

    // Cubit nesnesi oluşturuluyor ve mock servis ayarlanıyor
    late MostPopularListCubit mostPopularListCubit;
    mostPopularListCubit = MostPopularListCubit();

    setUp(() async {
      final res = await mockMostPopularListService.getMostPopuler();
      when(res.data).thenAnswer((_) => mockMostPopularResponse);
    });

    tearDown(() {
      mostPopularListCubit.close();
    });

    test('Initial State Test', () {
      // Başlangıç durumunun testi
      expect(mostPopularListCubit.state, const MostPopularListState());
    });

    blocTest<MostPopularListCubit, MostPopularListState>(
      'Get Most Popular Success Test',
      build: () => mostPopularListCubit,
      act: (cubit) => cubit.getMostPopular(),
      expect: () => [
        // Yükleme durumu bekleniyor
        const MostPopularListState(mostPopularState: MostPopularState.loading),

        // Başarılı durum ve sonuçlar bekleniyor
        MostPopularListState(
            mostPopularState: MostPopularState.success, mostPopularResponse: mockMostPopularResponse.results!),
      ],
    );

    blocTest<MostPopularListCubit, MostPopularListState>(
      'Get Most Popular Failure Test',
      build: () => mostPopularListCubit,
      act: (cubit) {
        when(mockMostPopularListService.getMostPopuler()).thenThrow(Exception('Failed to fetch data'));
        cubit.getMostPopular();
      },
      expect: () => [
        // Yükleme durumu bekleniyor
        const MostPopularListState(mostPopularState: MostPopularState.loading),

        // Hata durumu bekleniyor
        const MostPopularListState(mostPopularState: MostPopularState.failure),
      ],
    );
  });
}
