import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_probe_app/constants/text_constants.dart';
import 'package:media_probe_app/feature/most_popular_detail/view/most_popular_detail_screen.dart';
import 'package:media_probe_app/feature/most_popular_list/cubit/most_popular_list_cubit.dart';
import 'package:media_probe_app/feature/most_popular_list/cubit/most_popular_list_state.dart';

class MostPopularListScreen extends StatelessWidget {
  const MostPopularListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MostPopularListCubit()..getMostPopular(),
      child: const MostPopularListView(),
    );
  }
}

class MostPopularListView extends StatelessWidget {
  const MostPopularListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text(TextConstants.appBarListTitle),
        actions: const [Icon(Icons.search), Icon(Icons.more_vert)],
      ),
      body: BlocBuilder<MostPopularListCubit, MostPopularListState>(
        builder: (context, state) {
          switch (state.mostPopularState) {
            case MostPopularState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case MostPopularState.success:
              return MostPopularListTile(state: state);

            case MostPopularState.failure:
              return const Center(child: Text(TextConstants.errorMesssage));

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

class MostPopularListTile extends StatelessWidget {
  const MostPopularListTile({
    super.key,
    required this.state,
  });
  final MostPopularListState state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListTile(
                title: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        state.mostPopularResponse[index].title ?? "",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      state.mostPopularResponse[index].abstract ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text(
                            state.mostPopularResponse[index].byline ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const Spacer(),
                      Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.calendar_month, size: 17),
                              ),
                              Text(state.mostPopularResponse[index].publishedDate ?? ""),
                            ],
                          ))
                    ],
                  ),
                ),
                trailing: const Icon(Icons.arrow_right_outlined),
                leading: (state.mostPopularResponse[index].media?.length ?? 0) > 0
                    ? CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            state.mostPopularResponse[index].media?[0].mediaMetadata?[0].url ??
                                TextConstants.defaultAvatar),
                      )
                    : const CircleAvatar(
                        backgroundImage: NetworkImage(TextConstants.defaultAvatar),
                      )),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return MostPopularDetailScreen(mostPopularResult: state.mostPopularResponse[index]);
              },
            ));
          },
        );
      },
      itemCount: state.mostPopularResponse.length,
    );
  }
}
