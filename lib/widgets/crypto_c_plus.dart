import 'package:crypto_c_plus/bloc/coins/bottom_navigation_bar/bottom_navigation_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'body.dart';

class CryptoCPlus extends StatefulWidget {
  @override
  _CryptoCPlusState createState() => _CryptoCPlusState();
}

class _CryptoCPlusState extends State<CryptoCPlus> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _navigationBloc = BlocProvider.of<BottomNavigationBarBloc>(context);
    _navigationBloc.add(GetBottomNavigationBar());
    return BlocBuilder(
      cubit: _navigationBloc,
      builder: (context, state) {
        if (state is BottomNavigationBarInitial) {
          return CircularProgressIndicator();
        } else if (state is BottomNavigationBarLoadedState) {
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
            drawer: Drawer(),
            floatingActionButton: state.floatingActionButton,
            floatingActionButtonLocation: state.floatingActionButtonLocation,
            bottomNavigationBar: state.bottomNavigationBar,
            body: BodyWidget(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
