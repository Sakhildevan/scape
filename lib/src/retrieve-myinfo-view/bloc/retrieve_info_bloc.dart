import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/src/retrieve-myinfo-view/data/repository/retrieve_info_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import 'retrieve_info_event.dart';
import 'retrieve_info_state.dart';

class RetrieveInfoBloc extends Bloc<RetrieveInfoEvent, RetrieveInfoState> {
  final RetrieveInfoRepository retrieveInfoRepository;
  RetrieveInfoBloc({required this.retrieveInfoRepository})
      : super(const RetrieveInfoState()) {
    on<GetSingPassRedirectUrl>(_getSingPassRedirectUrl);
    on<ValidateSingpass>(_validateSingpass);
  }

  FutureOr<void> _getSingPassRedirectUrl(
    GetSingPassRedirectUrl event,
    Emitter<RetrieveInfoState> emit,
  ) async {
    emit(state.copyWith(initialApiStatus: ApiStatus.loading));
    final result = await retrieveInfoRepository.getRedirectUrl();
    emit(state.copyWith(initialApiStatus: ApiStatus.completed));
    result.fold(
      (failure) {
        emit(state.copyWith(
          initialApiStatus: ApiStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (eventInfo) async {
        emit(state.copyWith(
          initialApiStatus: ApiStatus.success,
        ));
        if (await launchUrl(
          Uri.parse(eventInfo.singPassRedirectDetails?.RedirectURL ?? ""),
          webOnlyWindowName: '_self',
        )) {
          throw Exception(
              'Could not launch ${eventInfo.singPassRedirectDetails?.RedirectURL}');
        }
      },
    );
  }

  FutureOr<void> _validateSingpass(
    ValidateSingpass event,
    Emitter<RetrieveInfoState> emit,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final result = await retrieveInfoRepository.validateSingpass(event.token);
    emit(state.copyWith(apiStatus: ApiStatus.completed));
    result.fold(
      (failure) => emit(state.copyWith(
        apiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      )),
      (result) async {
        emit(
          state.copyWith(
            apiStatus: ApiStatus.success,
            isMyInfoVerified:
                result.singPassValidateRedirectDetails?.IsMyInfoVerified ?? "",
          ),
        );
      },
    );
  }
}
