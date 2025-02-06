import 'package:scape/config/network/api_helper.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/api_endpoints.dart';
import 'package:scape/src/home/data/model/user_model.dart';

class HomeDataSource {
  final APIHelper _apiHelper;

  HomeDataSource(this._apiHelper);

  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _apiHelper.request(
        url: APIEndpoints.getUserEndpoints,
        method: Method.GET,
      );
      logger.d(response);
      return []; //Return the list using fromJson
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }
}
