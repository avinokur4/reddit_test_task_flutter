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
    return BlocBuilder<WalletsListBloc, WalletsListState>(
      builder: (context, state) {
        if (state is GetWalletsListState) {
          final wallets = state.walletsList['children'] as List<Map<String, dynamic>>;
          if (state.walletsList.isNotEmpty) {
            return ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemCount: state.walletsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return FeedItem(wallets[index]['data']['title'], wallets[index]['data']['selftext']);
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
