import 'package:crypto_c_plus/widgets/single_coin_detail.dart';
import 'package:flutter/material.dart';

class BodySearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8, top: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          child: TextFormField(
            controller: _textController,
            decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
                hintText: "Search",
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.grey.shade800,
                  ),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {},
                )),
          ),
        ),
      ),
    );
  }
}
