import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/feed_service.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedListBloc extends Bloc<FeedListEvent, FeedListState> {
  FeedListBloc() : super(FeedListInitial());

  Map<String, dynamic> feed;
  final IFeedService feedService = FeedService();

  @override
  Stream<FeedListState> mapEventToState(
    FeedListEvent event,
  ) async* {
    if (event is FetchFeedEvent) {
      feed = await feedService.fetchFeed('/r/FlutterDev.json');

      yield GetFeedState(
        feed: feed,
      );
    }
  }
}
