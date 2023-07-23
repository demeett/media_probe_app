import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe_app/core/dependency/dependency_configuration.dart';
import 'package:media_probe_app/feature/most_popular_detail/view/most_popular_detail_screen.dart';
import 'package:media_probe_app/feature/most_popular_list/model/most_popular_response.dart';
import 'package:nock/nock.dart';

void main() {
  configureInjection();
  setUpAll(nock.init);

  setUp(() {
    nock.cleanAll();
  });
  group('Komponent Testleri - Anasayfa ', () {
    testWidgets('Text özelliğini test ediyoruz', (tester) async {
      MostPopularResult result = const MostPopularResult(
          abstract:
              "In a biological preserve in Mexico’s Campeche State, a team of archaeologists has documented pyramids, palaces, a ball court and other remains of an ancient city they call Ocomtún.",
          title: "On the Map, Nothing. On the Ground, a Hidden Maya City.",
          media: [
            MostPopularMedia(mediaMetadata: [
              MediaMetadata(
                  url:
                      "https://static01.nyt.com/images/2023/07/19/multimedia/00maya-site-03-ghtq/00maya-site-03-ghtq-mediumThreeByTwo440.jpg"),
              MediaMetadata(
                  url:
                      "https://static01.nyt.com/images/2023/07/19/multimedia/00maya-site-03-ghtq/00maya-site-03-ghtq-mediumThreeByTwo440.jpg"),
              MediaMetadata(
                  url:
                      "https://static01.nyt.com/images/2023/07/19/multimedia/00maya-site-03-ghtq/00maya-site-03-ghtq-mediumThreeByTwo440.jpg"),
            ])
          ]);
      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialApp(home: MostPopularDetailScreen(mostPopularResult: result)),
        );
        await tester.pumpAndSettle();
      });

      await expectLater(
          find.byType(MostPopularDetailScreen), matches("On the Map, Nothing. On the Ground, a Hidden Maya City."));
    });
  });
}
