import 'package:crypto_c_plus/data/cryptocurrencies_api_client.dart';
import 'package:crypto_c_plus/locator.dart';
import 'package:crypto_c_plus/models/currency.dart';

class CryptoCurrenciesRepository {
  CryptoCurrenciesApiClient cryptoCurrenciesApiClient =
      locator<CryptoCurrenciesApiClient>();

  Future<List<Currency>> getCoins() async {
    return await cryptoCurrenciesApiClient.getCoins();
  }

  Future<List<Currency>> getSingleCoin (String coinName) async {
    return await cryptoCurrenciesApiClient.getSingleCoin(coinName);
  }

}
