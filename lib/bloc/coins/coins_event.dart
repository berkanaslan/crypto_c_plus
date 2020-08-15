part of 'coins_bloc.dart';

abstract class CoinsEvent extends Equatable {
  const CoinsEvent();
}

class GetCoins extends CoinsEvent {
  @override
  List<Object> get props => [];
}

class GetSingleCoins extends CoinsEvent {
  String coinName;

  GetSingleCoins({@required this.coinName});

  @override
  List<Object> get props => [coinName];
}
