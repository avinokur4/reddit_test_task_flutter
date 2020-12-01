part of 'feed_bloc.dart';

abstract class WalletsListEvent extends Equatable {
  const WalletsListEvent();
}

class FetchWalletsEvent extends WalletsListEvent {
  const FetchWalletsEvent();
  @override
  List<Object> get props => null;
}