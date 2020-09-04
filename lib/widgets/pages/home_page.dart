import 'package:flutter/material.dart';
import '../body_search.dart';
import '../coin_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CryptoC+"),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodySearchWidget(),
              CoinList(),
            ],
          ),
        ),
      ),
    );
  }
}
