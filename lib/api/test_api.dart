import '../utils/http_util.dart';

class TestApi {
  static Future<Map> listProduction() async {
    return await HttpUtil().request('/baseInfo/listProduction');
  }
}
