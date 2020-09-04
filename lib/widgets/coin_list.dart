import 'package:crypto_c_plus/data/cryptocurrencies_repository.dart';
import 'package:crypto_c_plus/models/currency.dart';
import 'package:crypto_c_plus/widgets/single_coin_detail.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class CoinList extends StatefulWidget {
  @override
  _CoinListState createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  CryptoCurrenciesRepository _cryptoCurrenciesRepository =
  locator<CryptoCurrenciesRepository>();
  Future<List<Currency>> _getCoins;
  GlobalKey<RefreshIndicatorState> _refreshKey;

  @override
  void initState() {
    super.initState();
    _getCoins = _cryptoCurrenciesRepository.getCoins();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
  }

  Future<Null> _refreshCurrencies() async {
    _refreshKey.currentState?.show(atTop: true);
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _getCoins = _cryptoCurrenciesRepository.getCoins();
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        key: _refreshKey,
        onRefresh: _refreshCurrencies,
        child: FutureBuilder(
          future: _getCoins,
          builder:
              (BuildContext context, AsyncSnapshot<List<Currency>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset("assets/images/coin_images/" +
                            snapshot.data[index].symbol.toLowerCase() +
                            ".png"),
                      ),
                      title: Text(
                        "\$" +
                            double.parse(snapshot.data[index].price_usd)
                                .toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: snapshot.data[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ", " + snapshot.data[index].symbol),
                            ]),
                      ),
                      trailing: Icon(
                        Icons.star_border,
                        color: Colors.orangeAccent,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleCoinDetailWidget(
                                coin: snapshot.data[index],
                              ),
                        ));
                      },
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
