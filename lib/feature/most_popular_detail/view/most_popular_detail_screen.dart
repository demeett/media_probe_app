import 'package:flutter/material.dart';
import 'package:media_probe_app/constants/text_constants.dart';
import '../../most_popular_list/model/most_popular_response.dart';

class MostPopularDetailScreen extends StatelessWidget {
  const MostPopularDetailScreen({super.key, this.mostPopularResult});
  final MostPopularResult? mostPopularResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(key: Key(TextConstants.appBarKey), TextConstants.appBarDetailTitle),
      ),
      body: Column(
        children: [
          Image.network(
            mostPopularResult?.media?[0].mediaMetadata?[2].url ?? TextConstants.defaultAvatar,
            height: 293,
            width: 440,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.calendar_month,
                  size: 15,
                ),
                Text(
                  mostPopularResult?.publishedDate ?? "",
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Text(
                mostPopularResult?.title ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(mostPopularResult?.abstract ?? ""),
          )
        ],
      ),
    );
  }
}
