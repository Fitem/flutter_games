import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_games/common/widget/pull/app_pull_new_load_widget.dart';
import 'package:flutter_games/page/main/girls_bloc.dart';
import 'package:flutter_games/page/main/grils_item.dart';

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
  final GirlsBloc girlsBloc = new GirlsBloc();

  ///控制列表滚动和监听
  final ScrollController scrollController = new ScrollController();

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  bool _ignoring = true;

  /// 模拟IOS下拉显示刷新
  showRefreshLoading() {
    ///直接触发下拉
    new Future.delayed(const Duration(milliseconds: 500), () {
      scrollController
          .animateTo(-141,
              duration: Duration(milliseconds: 600), curve: Curves.linear)
          .then((_) {
        /*setState(() {
          _ignoring = false;
        });*/
      });
      return true;
    });
  }

  scrollToTop() {
    if (scrollController.offset <= 0) {
      scrollController
          .animateTo(0,
              duration: Duration(milliseconds: 600), curve: Curves.linear)
          .then((_) {
        showRefreshLoading();
      });
    } else {
      scrollController.animateTo(0,
          duration: Duration(milliseconds: 600), curve: Curves.linear);
    }
  }

  ///下拉刷新数据
  Future<void> requestRefresh() async {
    await girlsBloc.requestRefresh().catchError((e) {
      print(e);
    });
    setState(() {
      _ignoring = false;
    });
  }

  ///上拉更多请求数据
  Future<void> requestLoadMore() async {
    return await girlsBloc.requestLoadMore();
  }

  @override
  void initState() {
    super.initState();

    ///监听生命周期，主要判断页面 resumed 的时候触发刷新
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    ///请求更新
    if (girlsBloc.getDataLength() == 0) {
      girlsBloc.changeNeedHeaderStatus(false);

      ///先读数据库
      girlsBloc.requestRefresh().then((_) {
        showRefreshLoading();
      });
    }
    super.didChangeDependencies();
  }

  ///监听生命周期，主要判断页面 resumed 的时候触发刷新
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (girlsBloc.getDataLength() != 0) {
        showRefreshLoading();
      }
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    girlsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // See AutomaticKeepAliveClientMixin.
    var content = AppPullLoadWidget(
      girlsBloc.pullLoadWidgetControl,
      (BuildContext context, int index) => _getItems(index),
      requestRefresh,
      requestLoadMore,
      refreshKey: refreshIndicatorKey,
      scrollController: scrollController,

      ///使用ios模式的下拉刷新
      userIos: true,
    );
    return IgnorePointer(
      ignoring: _ignoring,
      child: content,
    );
  }

  _getItems(int index) {
    return new GirlsItem(girlsBloc.dataList[index]);
  }
}
