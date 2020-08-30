import 'package:flutter_games/common/config/config.dart';
import 'package:flutter_games/common/dao/event_dao.dart';
import 'package:flutter_games/common/widget/pull/app_pull_new_load_widget.dart';

class GirlsBloc {
  final AppPullLoadWidgetControl pullLoadWidgetControl =
      new AppPullLoadWidgetControl();

  int _page = 2;

  requestRefresh() async {
    pageReset();
    var res = await EventDao.getGirlsPic(_page);
    changeLoadMoreStatus(getLoadMoreStatus(res));
    refreshData(res);
    return res;
  }

  requestLoadMore() async {
    pageUp();
    var res = await EventDao.getGirlsPic(_page);
    changeLoadMoreStatus(getLoadMoreStatus(res));
    loadMoreData(res);
    return res;
  }

  pageReset() {
    _page = 2;
  }

  pageUp() {
    _page++;
  }

  getLoadMoreStatus(res) {
    return (res != null &&
        res.data != null &&
        res.data.results != null &&
        res.data.results.length == Config.PAGE_SIZE);
  }

  ///列表数据长度
  int getDataLength() {
    return pullLoadWidgetControl.dataList.length;
  }

  ///修改加载更多
  changeLoadMoreStatus(bool needLoadMore) {
    pullLoadWidgetControl.needLoadMore = needLoadMore;
  }

  ///是否需要头部
  changeNeedHeaderStatus(bool needHeader) {
    pullLoadWidgetControl.needHeader = needHeader;
  }

  ///刷新列表数据
  refreshData(res) {
    if (res != null) {
      pullLoadWidgetControl.dataList = res.data.results;
    }
  }

  ///加载更多数据
  loadMoreData(res) {
    if (res != null) {
      pullLoadWidgetControl.addList(res.data.results);
    }
  }

  ///清理数据
  clearData() {
    refreshData([]);
  }

  ///列表数据
  get dataList => pullLoadWidgetControl.dataList;

  void dispose() {
    pullLoadWidgetControl.dispose();
  }
}
