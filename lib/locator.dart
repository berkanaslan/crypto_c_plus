import 'package:crypto_c_plus/data/cryptocurrencies_api_client.dart';
import 'package:crypto_c_plus/data/cryptocurrencies_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => CryptoCurrenciesApiClient());
  locator.registerLazySingleton(() => CryptoCurrenciesRepository());
  }