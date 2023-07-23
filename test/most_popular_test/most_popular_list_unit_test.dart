import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe_app/core/dependency/dependency_configuration.dart';
import 'package:media_probe_app/feature/most_popular_list/service/most_popular_list_service.dart';

void main() {
  // setUpAll(nock.init);
  configureInjection();
  // setUp(() {
  //   nock.cleanAll();
  // });
  test("description", () async {
    // WidgetsFlutterBinding.ensureInitialized();
    final MostPopularListService service = getIt.get<MostPopularListService>();
    final response = await service.getMostPopuler();

    expect(response.data?.results?.every((element) => element.abstract is String), true);
    expect(response.data?.results?.every((element) => element.title is String), true);
    expect(response.data?.results?.every((element) => element.publishedDate is String), true);
    expect(response.data?.results?.length, 20);
  });
}
