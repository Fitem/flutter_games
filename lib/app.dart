import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_games/common/event/http_error_event.dart';
import 'package:flutter_games/common/event/index.dart';
import 'package:flutter_games/common/localization/app_localizations_delegate.dart';
import 'package:flutter_games/common/localization/default_localizations.dart';
import 'package:flutter_games/common/net/code.dart';
import 'package:flutter_games/common/style/app_style.dart';
import 'package:flutter_games/common/utils/common_utils.dart';
import 'package:flutter_games/common/utils/navigator_utils.dart';
import 'package:flutter_games/page/home/home_page.dart';
import 'package:flutter_games/redux/app_state.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux/redux.dart';

class FlutterReduxApp extends StatefulWidget {
  @override
  _FlutterReduxAppState createState() => _FlutterReduxAppState();
}

class _FlutterReduxAppState extends State<FlutterReduxApp>
    with HttpErrorListener, NavigatorObserver {
  final store = new Store<AppState>(appReducer,
      initialState: new AppState(
        themeData: CommonUtils.getThemeData(AppColors.primarySwatch),
        locale: Locale('zh', 'CH'),
      ));

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      /// 通过 with NavigatorObserver ，在这里可以获取可以往上获取到
      /// MaterialApp 和 StoreProvider 的 context
      /// 还可以获取到 navigator;
      /// 比如在这里增加一个监听，如果 token 失效就退回登陆页。
      navigator.context;
      navigator;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new StoreBuilder<AppState>(builder: (context, store) {
        store.state.platformLocale = WidgetsBinding.instance.window.locale;
        return new MaterialApp(

            ///多语言实现代理
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              AppLocalizationsDelegate.delegate
            ],
            supportedLocales: [store.state.locale],
            locale: store.state.locale,
            theme: store.state.themeData,
            navigatorObservers: [this],

            ///命名式路由
            /// "/" 和 MaterialApp 的 home 参数一个效果
            routes: {
              HomePage.sName: (context) {
                _context = context;
                return NavigatorUtils.pageContainer(new HomePage(), context);
              }
            });
      }),
    );
  }
}

mixin HttpErrorListener on State<FlutterReduxApp> {
  StreamSubscription stream;
  BuildContext _context;

  @override
  void initState() {
    super.initState();

    stream = eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  ///网络错误提醒
  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        showToast(AppLocalizations.i18n(_context).network_error);
        break;
      case Code.NETWORK_TIMEOUT:
        //超时
        showToast(AppLocalizations.i18n(_context).network_error_timeout);
        break;
      default:
        showToast(AppLocalizations.i18n(_context).network_error_unknown +
            " " +
            message);
        break;
    }
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG);
  }
}
