import 'package:crypto_c_plus/bloc/coins/bottom_navigation_bar/bottom_navigation_bar_bloc.dart';
import 'package:crypto_c_plus/bloc/coins/coins_bloc.dart';
import 'package:crypto_c_plus/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/crypto_c_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final Color statusColor = Colors.white;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: statusColor,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    setupLocator();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoinsBloc>(
      create: (context) => CoinsBloc(),
      child: BlocProvider<BottomNavigationBarBloc>(
        create: (context) => BottomNavigationBarBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "CryptoC+",
          theme: ThemeData(
            fontFamily: "Basier",
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.white,
            accentColor: Colors.black,
          ),
          home: CryptoCPlus(),
        ),
      ),
    );
  }
}
