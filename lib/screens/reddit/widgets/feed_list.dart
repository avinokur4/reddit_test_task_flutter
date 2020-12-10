import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../feed_bloc/feed_bloc.dart';
import '../widgets/no_data.dart';
import './feed_item.dart';
import '../actions.dart';

class FeedList extends StatelessWidget with FeedActions {
  FeedList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedListBloc, FeedListState>(
      builder: (context, state) {
        if (state is GetFeedState) {
          final feed = state.feed['children'] as List<dynamic>;
          if (state.feed.isNotEmpty) {
            return ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemCount: state.feed.length,
                itemBuilder: (BuildContext context, int index) {
                  final feedItem = feed[index]['data'] as Map<String, dynamic>;
                  final title = feedItem['title'];
                  final selftext = feedItem['selftext'];
                  return FeedItem(title, selftext);
                });
          } else {
            return NoData();
          }
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
              ],
            ),
          );
        }
      },
    );
  }
}
