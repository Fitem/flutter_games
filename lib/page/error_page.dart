import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_games/common/localization/default_localizations.dart';
import 'package:flutter_games/common/style/app_style.dart';
import 'package:flutter_games/common/utils/common_utils.dart';

class ErrorPage extends StatefulWidget {
  final String errorMessage;
  final FlutterErrorDetails details;

  ErrorPage(this.errorMessage, this.details);

  @override
  ErrorPageState createState() => ErrorPageState();
}

class ErrorPageState extends State<ErrorPage> {
  static List<Map<String, dynamic>> sErrorStack =
      new List<Map<String, dynamic>>();
  static List<String> sErrorName = new List<String>();

  final TextEditingController textEditingController =
      new TextEditingController();

  addError(FlutterErrorDetails details) {
    try {
      var map = Map<String, dynamic>();
      map["error"] = details.toString();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    return Container(
      color: AppColors.primaryValue,
      child: new Center(
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: width,
          decoration: new BoxDecoration(
            color: Colors.white.withAlpha(30),
            gradient:
                RadialGradient(tileMode: TileMode.mirror, radius: 0.1, colors: [
              Colors.white.withAlpha(10),
              AppColors.primaryValue.withAlpha(100),
            ]),
            borderRadius: BorderRadius.all(Radius.circular(width / 2)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image(
                  image: new AssetImage(AppICons.DEFAULT_USER_ICON),
                  width: 90.0,
                  height: 90.0),
              new SizedBox(
                height: 11,
              ),
              Material(
                child: new Text(
                  "Error Occur",
                  style: new TextStyle(fontSize: 24, color: Colors.white),
                ),
                color: AppColors.primaryValue,
              ),
              new SizedBox(
                height: 40,
              ),
              new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton(
                      color: AppColors.white.withAlpha(100),
                      onPressed: () {
                        String content = widget.errorMessage;
                        textEditingController.text = content;
                      },
                      child: Text("Report")),
                  new SizedBox(
                    width: 40,
                  ),
                  new FlatButton(
                      color: AppColors.white.withAlpha(100),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Back"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
