import 'file:///D:/Dosyalar/Repositories/Flutter/crypto_c_plus/crypto_c_plus/lib/widgets/pages/home_page.dart';
import 'file:///D:/Dosyalar/Repositories/Flutter/crypto_c_plus/crypto_c_plus/lib/widgets/pages/info_page.dart';
import 'package:crypto_c_plus/widgets/my_custom_botttom_nav_bar.dart';
import 'package:crypto_c_plus/widgets/pages/favorites_page.dart';
import 'package:crypto_c_plus/widgets/tab_items.dart';
import 'package:flutter/material.dart';

class CryptoCPlus extends StatefulWidget {
  @override
  _CryptoCPlusState createState() => _CryptoCPlusState();
}

class _CryptoCPlusState extends State<CryptoCPlus> {
  TabItem _currentTab = TabItem.Home;

  Map<TabItem, Widget> allPages() {
    return {
      TabItem.Home: HomePage(),
      TabItem.Favorites: FavoritesPage(),
      TabItem.Info: InfoPage(),
    };
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyCustomBottomNavigationBar(
        currentTab: _currentTab,
        pageCreator: allPages(),
        onSelectedTab: (selectedTab) {
          setState(() {
            _currentTab = selectedTab;
          });
          debugPrint("Seçilen tab: " + _currentTab.toString());
        },
      ),
    );
  }
}
