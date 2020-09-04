import 'dart:convert';
import 'package:crypto_c_plus/models/currency.dart';
import 'package:http/http.dart' as http;

class CryptoCurrenciesApiClient {
  static const baseUrl = "https://api.alternative.me/v1/ticker/";
  final http.Client httpClient = http.Client();

  Future<List<Currency>> getCoins() async {
    final locationUrl = baseUrl;
    final incomingCoinsValues = await httpClient.get(locationUrl);

    if (incomingCoinsValues.statusCode != 200) {
      throw Exception("Veri getirilemedi.");
    } else {
      final incomingValuesJSON = ((jsonDecode(incomingCoinsValues.body)) as List)
          .map((SingeCurrencyMap) => Currency.fromJson(SingeCurrencyMap))
          .toList();
      return incomingValuesJSON;
    }
  }

  Future<List<Currency>> getSingleCoin(String coinName) async {
    final singleCoinUrl = baseUrl + coinName + "/";
    final singleCoinValues = await httpClient.get(singleCoinUrl);
    if (singleCoinValues.statusCode != 200) {
      throw Exception("Veri getirilemedi.");
    } else {
      final singleIncomingValuesJSON = ((jsonDecode(singleCoinValues.body)) as List)
          .map((e) => Currency.fromJson(e))
          .toList();
      return singleIncomingValuesJSON;
    }
  }
}
