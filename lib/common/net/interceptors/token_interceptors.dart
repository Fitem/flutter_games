
import 'package:dio/dio.dart';

class TokenInterceptors extends InterceptorsWrapper {

  @override
  Future onRequest(RequestOptions options) {
    options.headers["token"] = "";
    options.headers["Content-Type"] = "application/json";
    // 添加请求头，解决403问题
    options.headers.remove("User-Agent");
    options.headers["User-Agent"] = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:0.9.4)";
    return super.onRequest(options);
  }
}