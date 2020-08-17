import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_games/app.dart';
import 'package:flutter_games/env/config_wrapper.dart';
import 'package:flutter_games/env/dev.dart';
import 'package:flutter_games/env/env_config.dart';
import 'package:flutter_games/page/error_page.dart';

void main() {
  runZoned((){
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
      return ErrorPage(
        details.exception.toString() + "\n " + details.stack.toString(), details);
    };
    runApp(ConfigWrapper(
      child: FlutterReduxApp(),
      config: EnvConfig.fromJson(config),
    ));
  }, onError: (Object obj, StackTrace stack){
    print(obj);
    print(stack);
  });
}
