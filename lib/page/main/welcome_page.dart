import 'package:flutter/material.dart';
import 'package:flutter_games/common/style/app_style.dart';
import 'package:flutter_games/redux/app_state.dart';
import 'package:flutter_games/widget/diff_scale_text.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';

/**
 * 主页我的tab页
 * Created by guoshuyu
 * Date: 2018-07-16
 */
class WelcomePage extends StatefulWidget {
  static final String sName = "welcome";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (context, store) {
        return Material(
          child: new Container(
            color: AppColors.white,
            child: Stack(
              children: <Widget>[
                Align(
                  child: Image(image: AssetImage('static/images/welcome.png')),
                ),
                Align(
                  child: DiffScaleText(
                    text: "232323",
                    textStyle: GoogleFonts.akronim().copyWith(
                      color: AppColors.primaryDarkValue,
                      fontSize: 76,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
