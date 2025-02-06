import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:scape/src/participant_ticket/data/datasource/participant_datasource.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../model/participant_model/participant_ticket_model.dart';

class ParticipantRepository {
  final ParticipantDataSource participantDataSource;

  ParticipantRepository({required this.participantDataSource});

  ResultFuture<ParticipantTicketModel> getParticipant(String ticketCode) async {
    log(ticketCode);
    try {
      final response = await participantDataSource.getParticipant(ticketCode);
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
