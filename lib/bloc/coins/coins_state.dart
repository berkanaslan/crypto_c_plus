part of 'coins_bloc.dart';

abstract class CoinsState extends Equatable {
  const CoinsState();
}

class CoinsInitial extends CoinsState {
  @override
  List<Object> get props => [];
}

class CoinsLoadingState extends CoinsState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class CoinsLoadedState extends CoinsState {
  List<Currency> currencies;

  CoinsLoadedState({@required this.currencies});

  @override
  List<Object> get props => [currencies];
}

class SingleCoinLoadedState extends CoinsState {
  List<Currency> currency;

  SingleCoinLoadedState({@required this.currency});

  @override
  List<Object> get props => [currency];
}

class CoinsErrorState extends CoinsState {
  @override
  List<Object> get props => throw UnimplementedError();
}
