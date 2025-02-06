import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:scape/src/ticket_details/data/data_source/ticket_details_data_source.dart';
import 'package:scape/src/ticket_details/model/dynamic_ticket_model/dynamic_ticket_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../model/static_page_model/static_page_model.dart';
import '../../model/ticket_model/ticket_model.dart';

class TicketDetailsRepostory {
  final TicketDetailsDataSource ticketDetailsDataSource;

  TicketDetailsRepostory({required this.ticketDetailsDataSource});

  ResultFuture<TicketModel> getTicket(String ticketCode) async {
    log(ticketCode);
    try {
      final response = await ticketDetailsDataSource.getTicket(ticketCode);
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<DynamicTicketModel> getDynamicTicket(
      String referenceCode) async {
    try {
      final response =
          await ticketDetailsDataSource.getDynamicTicket(referenceCode);
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }

  ResultFuture<StaticPageModel> getStatic() async {
    try {
      final response = await ticketDetailsDataSource.getStatic();
      return Right(response);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
