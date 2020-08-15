import 'package:crypto_c_plus/bloc/coins/coins_bloc.dart';
import 'package:crypto_c_plus/widgets/single_coin_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _coinsBloc = BlocProvider.of<CoinsBloc>(context);
    return Expanded(
      child: BlocBuilder(
          cubit: _coinsBloc,
          builder: (context, state) {
            if (state is CoinsInitial) {
              _coinsBloc.add(GetCoins());
              return Center(child: CircularProgressIndicator());
            } else if (state is CoinsLoadedState) {
              return ListView.builder(
                itemCount: state.currencies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset("assets/images/coin_images/" +
                          state.currencies[index].symbol.toLowerCase() +
                          ".png"),
                    ),
                    title: Text(
                      "\$" + double.parse(state.currencies[index].price_usd).toString(),
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
                                text: state.currencies[index].name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ", " + state.currencies[index].symbol),
                          ]),
                    ),
                    trailing: Icon(
                      Icons.star_border,
                      color: Colors.orangeAccent,
                    ),
                    onTap: () {
                      _coinsBloc
                          .add(GetSingleCoins(coinName: state.currencies[index].id));
                    },
                  );
                },
              );
            } else if (state is SingleCoinLoadedState) {
              return SingleCoinDetailWidget();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
