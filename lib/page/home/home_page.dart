import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_games/common/localization/default_localizations.dart';
import 'package:flutter_games/common/style/app_style.dart';
import 'package:flutter_games/common/widget/app_tabbar_widget.dart';
import 'package:flutter_games/common/widget/app_title_bar.dart';
import 'package:flutter_games/page/dynamic/dynamic_page.dart';
import 'package:flutter_games/page/main/welcome_page.dart';

class HomePage extends StatefulWidget {
  static final String sName = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<DynamicPageState> dynamicKey = new GlobalKey();

  /// 不退出
  Future<bool> _dialogExitApp(BuildContext context) async {
    ///如果是 android 回到桌面
    if (Platform.isAndroid) {
      AndroidIntent intent = AndroidIntent(
        action: 'android.intent.action.MAIN',
        category: "android.intent.category.HOME",
      );
      await intent.launch();
    }
    return Future.value(false);
  }

  _renderTab(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 16.0), new Text(text)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(AppICons.HOME, AppLocalizations.i18n(context).home_dynamic),
      _renderTab(AppICons.MORE, AppLocalizations.i18n(context).home_dynamic)
    ];
    return WillPopScope(
      onWillPop: () {
        return _dialogExitApp(context);
      },
      child: new AppTabBarWidget(
          type: TabType.bottom,
        tabItems: tabs,
        tabViews: [
          new DynamicPage(key: dynamicKey),
          new WelcomePage()
        ],
        onDoublePress: (index) {
            switch(index){
              case 0:
                break;
            }
        },
        backgroundColor: AppColors.primarySwatch,
        indicatorColor: AppColors.white,
        title: AppTitleBar(
          AppLocalizations.of(context).currentLocalized.app_name,
        ),
      ),
    );
  }
}
