import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:crypto_c_plus/bloc/coins/coins_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget>
    with SingleTickerProviderStateMixin {
  var _bottomNavIndex = 0; //default index of first screen
  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.home,
    Icons.star,
    Icons.search,
    Icons.info,
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
          () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      notchAndCornersAnimation: animation,
      splashColor: Colors.deepPurpleAccent,
      icons: iconList,
      activeIndex: _bottomNavIndex,
      gapLocation: GapLocation.end,
      notchSmoothness: NotchSmoothness.defaultEdge,
      onTap: (index) =>
          setState(() {
            _bottomNavIndex = index;
            if(_bottomNavIndex == 0){
              BlocProvider.of<CoinsBloc>(context).add(GetCoins());
            }
          }),
      //other params
    );
  }
}
