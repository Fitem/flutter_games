/**
 * 视频
 * http://baobab.kaiyanapp.com/api/v2/feed?date=1503104400000&num=1
 */


/* 视频 */
//@GET("v2/feed?")
//fun getFirstHomeData(@Query("num") num: Int): Observable<HomeBean>
class Video {
  static const String host = "http://baobab.kaiyanapp.com/api/";

  static getFirstHome(num){
    return "${host}v2/feed?num=${num}";
  }
}
