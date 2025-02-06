import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scape/core/utils/common_widgets/error_view.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/initial_loader.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/src/start-booking/presentation/bloc/start_booking_bloc.dart';

class StartBookingView extends StatefulWidget {
  final String eventKey;
  const StartBookingView({super.key, required this.eventKey});

  @override
  State<StartBookingView> createState() => _StartBookingViewState();
}

class _StartBookingViewState extends State<StartBookingView> {
  @override
  void initState() {
    context.read<StartBookingBloc>().add(
          StoreEventInformation(
            eventKey: widget.eventKey,
          ),
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocConsumer<StartBookingBloc, StartBookingState>(
        listener: (context, state) {
          if (state.initialApiStatus == ApiStatus.success) {
            context.go(StringConst.emailProvidingViewRoute);
          }
        },
        builder: (context, state) {
          return state.initialApiStatus == ApiStatus.loading
              ? const InitialLoader()
              : state.initialApiStatus == ApiStatus.failure
                  ? ErrorView(
                      errorMessage: state.errorMessage,
                      tryAgain: () => context.read<StartBookingBloc>().add(
                            StoreEventInformation(
                              eventKey: widget.eventKey,
                            ),
                          ),
                    )
                  : state.initialApiStatus == ApiStatus.success
                      ? Container()
                      : const SizedBox.shrink();
        },
      ),
    );
  }
}
