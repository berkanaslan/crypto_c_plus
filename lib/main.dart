import 'package:crypto_c_plus/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CryptoC+",
      theme: ThemeData(
        fontFamily: "Basier",
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
      home: CryptoCPlus(),
    );
  }
}
