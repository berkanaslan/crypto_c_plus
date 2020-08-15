import 'package:flutter/material.dart';
import 'body_search.dart';
import 'coin_list.dart';

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
