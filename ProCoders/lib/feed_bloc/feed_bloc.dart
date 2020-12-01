import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/feed_service.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class WalletsListBloc extends Bloc<WalletsListEvent, WalletsListState> {
  WalletsListBloc() : super(WalletsListInitial());

  Map<String, dynamic> walletsList;
  final IWalletsListService walletsListService = WalletsListService();

  @override
  Stream<WalletsListState> mapEventToState(
    WalletsListEvent event,
  ) async* {
    if (event is FetchWalletsEvent) {
      walletsList = await walletsListService.fetchWalletsList('/r/FlutterDev.json');

      yield GetWalletsListState(
        walletsList: walletsList,
      );
    }
  }
}
