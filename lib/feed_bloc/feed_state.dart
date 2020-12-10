part of 'feed_bloc.dart';

abstract class FeedListState extends Equatable {
  const FeedListState();
}

class FeedListInitial extends FeedListState {
  @override
  List<Object> get props => [];
}

class GetFeedState extends FeedListState {
  const GetFeedState({this.feed});
  final Map<String, dynamic> feed;

  @override
  List<Object> get props => [feed];
}
