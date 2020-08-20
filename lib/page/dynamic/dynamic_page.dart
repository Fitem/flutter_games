import 'package:flutter/material.dart';
import 'package:flutter_games/common/dao/event_dao.dart';
import 'package:flutter_games/common/style/app_style.dart';
import 'package:flutter_games/model/home_entity.dart';
import 'package:flutter_games/redux/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DynamicPage extends StatefulWidget {
  DynamicPage({Key key}) : super(key: key);

  @override
  DynamicPageState createState() => DynamicPageState();
}

class DynamicPageState extends State<DynamicPage>
    with AutomaticKeepAliveClientMixin<DynamicPage>, WidgetsBindingObserver {
  ///控制列表滚动和监听
  final ScrollController scrollController = new ScrollController();

  bool isShow = false;
  HomeEntity homeEntity;

  refreshHome() {
    EventDao.getEventReceived(0).then((res) {
      if (res != null && res.result) {
        if (isShow) {
          setState(() {
            homeEntity = res.data;
          });
        }
      }
    });
  }

  @override
  void initState() {
    isShow = true;
    super.initState();
    refreshHome();
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
    TextStyle textStyle = TextStyle(
      fontSize: 20,
      color: Colors.black,
    );
    return new StoreBuilder<AppState>(
      builder: (context, store) {
        return Material(
          child: new Container(
            color: AppColors.white,
            child: Stack(
              children: <Widget>[
                new Center(
                    child: new Text(
                        homeEntity == null ? "暂无数据" : homeEntity.nextPageUrl,
                        style: textStyle.merge(
                            TextStyle()),
                        maxLines: 1,
                        textDirection: TextDirection.ltr)
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
