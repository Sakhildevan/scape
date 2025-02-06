import 'package:scape/config/network/api_helper.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/helper/logger.dart';
import '../../../../core/utils/api_endpoints.dart';
import '../../../../core/utils/string_constants.dart';
import '../../model/participant_model/participant_ticket_model.dart';

class ParticipantDataSource {
  APIHelper apiHelper;
  ParticipantDataSource(this.apiHelper);

  Future<ParticipantTicketModel> getParticipant(String ticketCode) async {
    try {
      final response = await apiHelper.request(
        url: APIEndpoints.getParticipant(ticketCode),
        method: Method.GET,
      );
      logger.d("getParticipant ==> $response");
      final result = ParticipantTicketModel.fromJson(response.data);
      if (result.isSuccess == StringConst.yesKey) {
        return result;
      } else {
        throw APIException(
          message: result.errorOnFailure ?? StringConst.somethingWentWrong,
          statusCode: 200,
        );
      }
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
