import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_games/common/dao/event_dao.dart';
import 'package:flutter_games/common/style/app_style.dart';
import 'package:flutter_games/model/girls_entity.dart';
import 'package:flutter_games/redux/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

/**
 * Girls
 */
class GirlsPage extends StatefulWidget {
  static final String sName = "girls";

  GirlsPage({Key key}) : super(key: key);

  @override
  _GirlsPageState createState() => _GirlsPageState();
}

class _GirlsPageState extends State<GirlsPage>
    with AutomaticKeepAliveClientMixin<GirlsPage>, WidgetsBindingObserver {
  bool isShow = false;
  List<GirlsResult> results;

  ///控制列表滚动和监听
  final ScrollController _scrollController = new ScrollController();

  getGirlsPic(ps, pg) {
    EventDao.getGirlsPic(ps, pg).then((res) {
      if (res != null && res.result) {
        if (isShow) {
          setState(() {
            results = res.data.results;
          });
        }
      }
    });
  }

  TextStyle textStyle = TextStyle(
    fontSize: 20,
    color: Colors.black,
  );

  @override
  void initState() {
    super.initState();
    isShow = true;
    getGirlsPic(20, 2);
  }

  @override
  void dispose() {
    isShow = false;
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<AppState>(
      builder: (context, store) {
        return Material(
          child: new Container(
            color: AppColors.white,
            child: Stack(
              children: <Widget>[
                new Center(
                    child: results == null || results.length == 0
                        ? new Text("暂无数据",
                            style: textStyle.merge(TextStyle()),
                            maxLines: 1,
                            textDirection: TextDirection.ltr)
                        : new ListView.builder(
                            ///保持ListView任何情况都能滚动，解决在RefreshIndicator的兼容问题。
                            physics: const AlwaysScrollableScrollPhysics(),

                            ///根据状态返回子孔健
                            itemBuilder: (context, index) {
                              return _getItem(index);
                            },

                            ///根据状态返回数量
                            itemCount: _getListCount(),

                            ///滑动监听
                            controller: _scrollController,
                          )),
              ],
            ),
          ),
        );
      },
    );
  }

  _getItem(int index) {
    return Image.network(
      results[index].url ?? AppICons.DEFAULT_REMOTE_PIC,
      width: window.physicalSize.width,
      height: 240.0,
      //类似于Android的scaleType 此处让图片尽可能小 以覆盖整个widget
      fit: BoxFit.contain,
    );
  }

  _getListCount() {
    return results.length;
  }
}
