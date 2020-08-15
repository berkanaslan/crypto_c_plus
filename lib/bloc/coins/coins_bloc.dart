import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:crypto_c_plus/data/cryptocurrencies_repository.dart';
import 'package:crypto_c_plus/locator.dart';
import 'package:crypto_c_plus/models/currency.dart';
import 'package:crypto_c_plus/widgets/coin_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'coins_event.dart';

part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  CryptoCurrenciesRepository cryptoCurrenciesRepository =
  locator<CryptoCurrenciesRepository>();

  CoinsBloc() : super(CoinsInitial());

  @override
  Stream<CoinsState> mapEventToState(CoinsEvent event) async* {
    if (event is GetCoins) {
      yield CoinsLoadingState();
      try {
        // Get coins's  details:
        final calledCoins = await cryptoCurrenciesRepository.getCoins();
        yield CoinsLoadedState(currencies: calledCoins);
      } catch (e) {
        yield CoinsErrorState();
      }
    } else if (event is GetSingleCoins) {
      yield CoinsLoadingState();
      try {
        // Get single coin's details:
        final calledCoin = await cryptoCurrenciesRepository.getSingleCoin(event.coinName);
        yield SingleCoinLoadedState(currency: calledCoin);
      } catch (e) {
        yield CoinsErrorState();
      }
    }
  }
}
