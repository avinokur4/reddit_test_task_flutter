import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feed_bloc/feed_bloc.dart';
mixin FeedActions {
  void selectWallet(BuildContext context) {
    BlocProvider.of<FeedListBloc>(context)
        .add(FetchFeedEvent());
  }
}
