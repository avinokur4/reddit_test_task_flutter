import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feed_bloc/feed_bloc.dart';

import 'widgets/feed_list.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<WalletsListBloc, WalletsListState>(
      builder: (context, state) {
        if (state is GetWalletsListState) {
          return Scaffold(
            body: FeedList(),
          );
        } else {
          return null;
        }
      },
    );
  }
}
