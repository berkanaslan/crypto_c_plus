import 'package:crypto_c_plus/bloc/coins/coins_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SingleCoinDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _coinsBloc = BlocProvider.of<CoinsBloc>(context);
    return BlocBuilder(
      cubit: _coinsBloc,
      builder: (context, state) {
        if (state is SingleCoinLoadedState) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      buildCoinImage(state),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: buildCoinName(state),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: buildCoinPrice(state),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: buildPercentChangeWidget(state),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: buildMarcetCarAndSupply(state),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: updatedTime(state),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  RichText buildCoinPrice(SingleCoinLoadedState state) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        children: <TextSpan>[
          TextSpan(text: "\$", style: TextStyle(fontSize: 24)),
          TextSpan(
              text: double.parse(state.currency[0].price_usd).toString(),
              style: TextStyle(fontSize: 32)),
        ],
      ),
    );
  }

  RichText buildCoinName(SingleCoinLoadedState state) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: state.currency[0].name + ", ", style: TextStyle(fontSize: 24)),
          TextSpan(text: state.currency[0].symbol, style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }

  Image buildCoinImage(SingleCoinLoadedState state) {
    return Image.asset(
      "assets/images/coin_images/" + state.currency[0].symbol.toLowerCase() + ".png",
      height: 64,
      width: 64,
    );
  }

  Row buildPercentChangeWidget(SingleCoinLoadedState state) {
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
              "%" + double.parse(state.currency[0].percent_change_1h).toStringAsFixed(3),
              style: TextStyle(
                  color: double.parse(state.currency[0].percent_change_1h) == 0
                      ? Colors.grey
                      : double.parse(state.currency[0].percent_change_1h) > 0
                          ? Colors.green
                          : Colors.red),
            ),
            Text(
              ((double.parse(state.currency[0].price_usd) *
                          double.parse(state.currency[0].percent_change_1h)) /
                      100)
                  .toStringAsFixed(2),
              style: TextStyle(
                  color: double.parse(state.currency[0].percent_change_1h) == 0
                      ? Colors.grey
                      : double.parse(state.currency[0].percent_change_1h) > 0
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
              "%" + double.parse(state.currency[0].percent_change_24h).toStringAsFixed(3),
              style: TextStyle(
                  color: double.parse(state.currency[0].percent_change_24h) == 0
                      ? Colors.grey
                      : double.parse(state.currency[0].percent_change_24h) > 0
                          ? Colors.green
                          : Colors.red),
            ),
            Text(
              ((double.parse(state.currency[0].price_usd) *
                          double.parse(state.currency[0].percent_change_24h)) /
                      100)
                  .toStringAsFixed(2),
              style: TextStyle(
                  color: double.parse(state.currency[0].percent_change_24h) == 0
                      ? Colors.grey
                      : double.parse(state.currency[0].percent_change_24h) > 0
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
              "%" + double.parse(state.currency[0].percent_change_7d).toStringAsFixed(3),
              style: TextStyle(
                  color: double.parse(state.currency[0].percent_change_7d) == 0
                      ? Colors.grey
                      : double.parse(state.currency[0].percent_change_7d) > 0
                          ? Colors.green
                          : Colors.red),
            ),
            Text(
              ((double.parse(state.currency[0].price_usd) *
                          double.parse(state.currency[0].percent_change_7d)) /
                      100)
                  .toStringAsFixed(1),
              style: TextStyle(
                  color: double.parse(state.currency[0].percent_change_7d) == 0
                      ? Colors.grey
                      : double.parse(state.currency[0].percent_change_7d) > 0
                          ? Colors.green
                          : Colors.red),
            )
          ],
        ),
      ],
    );
  }

  Row buildMarcetCarAndSupply(SingleCoinLoadedState state) {
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
              double.parse(state.currency[0].available_supply).toString(),
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
              double.parse(state.currency[0].max_supply).toString(),
            ),
          ],
        ),
      ],
    );
  }

  updatedTime(SingleCoinLoadedState state) {
    var format = DateFormat("Hm");
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(
        int.parse(state.currency[0].last_updated + "000"));
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
}
