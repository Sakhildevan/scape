import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/error/failure.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/extensions.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/typedef.dart';

class StartBookingRepository {
  StartBookingRepository();

  //Get Event API
  ResultFuture<bool> storeEventKey({
    String? eventKey,
  }) async {
    try {
      String existedEventKey = await StringConst.eventKey.readFromGetStorage();

      if (existedEventKey.isNotEmpty && existedEventKey != eventKey) {
        logger.i("booking session removed");
        await GetStorage().remove(StringConst.isBookingSessionExistedKey);
      }
      logger.i("Storing Event key");
      await GetStorage().write(StringConst.eventKey, eventKey);

      return const Right(true);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
