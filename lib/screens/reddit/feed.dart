import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feed_bloc/feed_bloc.dart';

import 'widgets/feed_list.dart';
import 'widgets/no_data.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedListBloc, FeedListState>(
      builder: (context, state) {
        if (state is GetFeedState) {
          return Scaffold(
            body: SafeArea(child: FeedList()),
          );
        } else {
          return Scaffold(
            body: NoData(),
          );
        }
      },
    );
  }
}
