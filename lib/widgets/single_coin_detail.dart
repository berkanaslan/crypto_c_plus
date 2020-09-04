import 'package:crypto_c_plus/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleCoinDetailWidget extends StatelessWidget {
  final Currency coin;

  const SingleCoinDetailWidget({Key key, @required this.coin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildCoinImage(coin),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: buildCoinName(coin),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: buildCoinPrice(coin),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: buildPercentChangeWidget(coin),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: buildMarcetCarAndSupply(coin),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: updatedTime(coin),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

RichText buildCoinPrice(Currency coin) {
  return RichText(
    text: TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      children: <TextSpan>[
        TextSpan(text: "\$", style: TextStyle(fontSize: 24)),
        TextSpan(
            text: double.parse(coin.price_usd).toString(),
            style: TextStyle(fontSize: 32)),
      ],
    ),
  );
}

RichText buildCoinName(Currency coin) {
  return RichText(
    text: TextSpan(
      style: TextStyle(
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(text: coin.name + ", ", style: TextStyle(fontSize: 24)),
        TextSpan(text: coin.symbol, style: TextStyle(fontSize: 24)),
      ],
    ),
  );
}

Image buildCoinImage(Currency coin) {
  return Image.asset(
    "assets/images/coin_images/" + coin.symbol.toLowerCase() + ".png",
    height: 64,
    width: 64,
  );
}

Row buildPercentChangeWidget(Currency coin) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Text(
            "1h",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "%" + double.parse(coin.percent_change_1h).toStringAsFixed(3),
            style: TextStyle(
                color: double.parse(coin.percent_change_1h) == 0
                    ? Colors.grey
                    : double.parse(coin.percent_change_1h) > 0
                        ? Colors.green
                        : Colors.red),
          ),
          Text(
            ((double.parse(coin.price_usd) *
                        double.parse(coin.percent_change_1h)) /
                    100)
                .toStringAsFixed(2),
            style: TextStyle(
                color: double.parse(coin.percent_change_1h) == 0
                    ? Colors.grey
                    : double.parse(coin.percent_change_1h) > 0
                        ? Colors.green
                        : Colors.red),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            "24h",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "%" + double.parse(coin.percent_change_24h).toStringAsFixed(3),
            style: TextStyle(
                color: double.parse(coin.percent_change_24h) == 0
                    ? Colors.grey
                    : double.parse(coin.percent_change_24h) > 0
                        ? Colors.green
                        : Colors.red),
          ),
          Text(
            ((double.parse(coin.price_usd) *
                        double.parse(coin.percent_change_24h)) /
                    100)
                .toStringAsFixed(2),
            style: TextStyle(
                color: double.parse(coin.percent_change_24h) == 0
                    ? Colors.grey
                    : double.parse(coin.percent_change_24h) > 0
                        ? Colors.green
                        : Colors.red),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            "7d",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "%" + double.parse(coin.percent_change_7d).toStringAsFixed(3),
            style: TextStyle(
                color: double.parse(coin.percent_change_7d) == 0
                    ? Colors.grey
                    : double.parse(coin.percent_change_7d) > 0
                        ? Colors.green
                        : Colors.red),
          ),
          Text(
            ((double.parse(coin.price_usd) *
                        double.parse(coin.percent_change_7d)) /
                    100)
                .toStringAsFixed(1),
            style: TextStyle(
                color: double.parse(coin.percent_change_7d) == 0
                    ? Colors.grey
                    : double.parse(coin.percent_change_7d) > 0
                        ? Colors.green
                        : Colors.red),
          )
        ],
      ),
    ],
  );
}

Row buildMarcetCarAndSupply(Currency coin) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Text(
            "Available Supply",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            double.parse(coin.available_supply).toString(),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            "Max. Supply",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            double.parse(coin.max_supply).toString(),
          ),
        ],
      ),
    ],
  );
}

updatedTime(Currency coin) {
  var format = DateFormat("Hm");
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(
      int.parse(coin.last_updated + "000"));
  var dateString = format.format(date);
  return Column(
    children: [
      Text(
        "Last updated",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(
        dateString.toString(),
      ),
    ],
  );
}
