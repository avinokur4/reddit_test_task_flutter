part of 'feed_bloc.dart';

abstract class WalletsListState extends Equatable {
  const WalletsListState();
}

class WalletsListInitial extends WalletsListState {
  @override
  List<Object> get props => [];
}

class GetWalletsListState extends WalletsListState {
  const GetWalletsListState({this.walletsList});
  final Map<String, dynamic> walletsList;

  @override
  List<Object> get props => [walletsList];
}
