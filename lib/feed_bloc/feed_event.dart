part of 'feed_bloc.dart';

abstract class FeedListEvent extends Equatable {
  const FeedListEvent();
}

class FetchFeedEvent extends FeedListEvent {
  const FetchFeedEvent();
  @override
  List<Object> get props => null;
}