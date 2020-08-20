import 'package:flutter_games/common/dao/dao_result.dart';
import 'package:flutter_games/common/net/api.dart';
import 'package:flutter_games/common/net/video.dart';
import 'package:flutter_games/model/home_entity.dart';

class EventDao {

  static getEventReceived(num) async {
    String url = Video.getFirstHome(num);
    var res = await httpManager.netFetch(url, null, null, null);
    if (res != null ) {
      var data = res.data;
      if (data == null) {
        return null;
      }
      HomeEntity homeEntity = HomeEntity().fromJson(data);
      return new DataResult(homeEntity, true);
    } else {
      return new DataResult(null, false);
    }
  }
}
