import 'dart:ui';

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
  final ScrollController _scrollController = new ScrollController();

  bool isShow = false;
  List<HomeItemDataTag> tags = new List();

  refreshHome() {
    EventDao.getEventReceived(0).then((res) {
      if (res != null && res.result) {
        if (isShow) {
          setState(() {
            HomeEntity homeEntity = res.data;
            var issue = homeEntity.issueList[0];
            var itemList = issue.itemList;
            for (int i = 0; i < itemList.length; i++) {
              var item = itemList[i];
              var tags = item?.data.tags;
              if (tags != null) {
                this.tags.addAll(tags);
              }
            }
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
    return new StoreBuilder<AppState>(
      builder: (context, store) {
        return Material(
          child: new Container(
            color: AppColors.white,
            child: Stack(
              children: <Widget>[
                new Center(
                    child: tags == null || tags.length == 0
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
      tags[index].bgPicture ?? AppICons.DEFAULT_REMOTE_PIC,
      width: window.physicalSize.width,
      height: 240.0,
      //类似于Android的scaleType 此处让图片尽可能小 以覆盖整个widget
      fit: BoxFit.cover,
    );
  }

  _getListCount() {
    return tags.length;
  }
}
