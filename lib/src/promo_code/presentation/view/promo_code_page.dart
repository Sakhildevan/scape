import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_widgets/custom_image_network_widget.dart';
import 'package:scape/core/utils/common_widgets/custom_snackbar.dart';
import 'package:scape/core/utils/common_widgets/custom_view/custom_view.dart';
import 'package:scape/core/utils/common_widgets/custom_view/previous_btn.dart';
import 'package:scape/core/utils/common_widgets/enquires_view.dart';
import 'package:scape/core/utils/common_widgets/error_view.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/initial_loader.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/email-providing-view/data/model/event-model/event_info_model.dart';
import 'package:scape/src/email-providing-view/presentation/bloc/email_providing_bloc.dart';
import 'package:scape/src/promo_code/presentation/bloc/promo_code_bloc.dart';
import 'package:scape/src/promo_code/presentation/widgets/promo_bottom_button.dart';
import 'package:scape/src/registration/presentation/bloc/registration_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../widgets/promo_code_page_widgets.dart'; // Import the widget file

class PromoCodeDetails extends StatefulWidget {
  final String paymentReturnToken;

  const PromoCodeDetails({
    super.key,
    required this.paymentReturnToken,
  });

  @override
  State<PromoCodeDetails> createState() => _PromoCodeDetailsState();
}

class _PromoCodeDetailsState extends State<PromoCodeDetails> {
  @override
  void initState() {
    super.initState();
    context.read<RegistrationBloc>().add(const CheckLoginValidationEvent());
  }

  TextEditingController promoCodeController = TextEditingController();
  EventInfoModel eventInfo = const EventInfoModel();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) async {
        if (state.initialApiStatus == ApiStatus.failure) {
          var eventCode = await GetStorage().read(StringConst.eventKey);
          if (context.mounted) {
            context.replace("${StringConst.startBookingViewRoute}/$eventCode");
            customErrorSnackBar(context, message: "Login session expired");
          }
        } else if (state.initialApiStatus == ApiStatus.success) {
          if (widget.paymentReturnToken.isNotEmpty) {
            context.read<PromoCodeBloc>().add(ValidatePayment(
                  widget.paymentReturnToken,
                  context,
                ));
          }
          context.read<EmailProvidingBloc>().add(const GetEventInformation());
        }
      },
      buildWhen: (previous, current) {
        return current.initialApiStatus == ApiStatus.loading ||
            current.initialApiStatus == ApiStatus.failure ||
            current.initialApiStatus == ApiStatus.success;
      },
      builder: (context, registrationState) {
        return BlocConsumer<EmailProvidingBloc, EmailProvidingState>(
          listener: (context, state) {
            if (state.initialApiStatus == ApiStatus.success) {
              eventInfo = state.eventInfo;
              context.read<PromoCodeBloc>().add(GetBookingSessionDetails());
            }
          },
          buildWhen: (previous, current) {
            return current.initialApiStatus == ApiStatus.loading ||
                current.initialApiStatus == ApiStatus.failure ||
                current.initialApiStatus == ApiStatus.success;
          },
          builder: (context, emailState) {
            return BlocConsumer<PromoCodeBloc, PromoCodeState>(
              listener: (context, state) {
                if (state.initialApiStatus == ApiStatus.success) {
                } else if (state.apiStatus == ApiStatus.loading) {
                } else if (state.apiStatus == ApiStatus.completed) {
                } else if (state.apiStatus == ApiStatus.success) {
                  context
                      .read<PromoCodeBloc>()
                      .add(NavigateConfirmBooking(context));
                }
              },
              buildWhen: (previous, current) {
                return current.initialApiStatus == ApiStatus.loading ||
                    current.initialApiStatus == ApiStatus.failure ||
                    current.initialApiStatus == ApiStatus.success;
              },
              builder: (context, promoState) {
                return registrationState.initialApiStatus ==
                            ApiStatus.loading ||
                        promoState.initialApiStatus == ApiStatus.loading ||
                        emailState.initialApiStatus == ApiStatus.loading
                    ? const InitialLoader()
                    : registrationState.initialApiStatus == ApiStatus.failure ||
                            promoState.initialApiStatus == ApiStatus.failure ||
                            emailState.initialApiStatus == ApiStatus.failure
                        ? ErrorView(
                            errorMessage: emailState.errorMessage,
                            tryAgain: () => context
                                .read<EmailProvidingBloc>()
                                .add(const GetEventInformation()),
                          )
                        : registrationState.initialApiStatus ==
                                    ApiStatus.success &&
                                promoState.initialApiStatus ==
                                    ApiStatus.success &&
                                emailState.initialApiStatus == ApiStatus.success
                            ? CustomView(
                                isFromProfile: false,
                                showLogout: true,
                                contentWidget: _buildContent(context),
                              )
                            : const SizedBox.shrink();
              },
            );
          },
        );
      },
    );
  }

//Content
  Widget _buildContent(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.width * 0.1 - 40,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            KDimension().kHeight60,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: sizingInformation.isMobile || sizingInformation.isTablet
                  ? Column(
                      children: [
                        _contentBodyLeft(
                          sizeInformation: sizingInformation,
                          data: eventInfo,
                        ),
                        KDimension().kHeight20,
                        paymentCard(
                          context: context,
                          sizeInformation: sizingInformation,
                        ),
                        KDimension().kHeight20,
                        const EnquiresView(),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: sizingInformation.screenSize.width < 900
                              ? 300
                              : 340,
                          child: _contentBodyLeft(
                            sizeInformation: sizingInformation,
                            data: eventInfo,
                          ),
                        ),
                        SizedBox(
                          width: sizingInformation.screenSize.width * 0.04,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              paymentCard(
                                context: context,
                                sizeInformation: sizingInformation,
                              ),
                              KDimension().kHeight20,
                              const EnquiresView(),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            KDimension().kHeight80,
          ],
        ),
      ),
    );
  }

//Content Body Left Widget
  Widget _contentBodyLeft({
    required SizingInformation sizeInformation,
    required EventInfoModel data,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageNetworkWidget(
          imageUrl: data.eventSettings?.BannerURL ?? "",
          boxFit: BoxFit.fitWidth,
        ),
        KDimension().kHeight30,
        Kstyles().bold(
          text: "EVENT",
          color: AppColors.orange.withOpacity(0.9),
          size: getValueForScreenType(
            context: context,
            mobile: 16,
            desktop: 22,
          ),
        ),
        KDimension().kHeight10,
        Kstyles().bold(
          text: data.eventSettings?.EventName ?? "",
          size: getValueForScreenType(
            context: context,
            mobile: 24,
            desktop: 28,
          ),
          overflow: TextOverflow.visible,
        ),
        KDimension().kHeight10,
        Kstyles().med(
          text: data.eventSettings?.EventDescription ?? "",
          color: AppColors.black,
          size: 14,
          overflow: TextOverflow.visible,
        ),
        KDimension().kHeight05,
      ],
    );
  }

  Widget paymentCard({
    required BuildContext context,
    required SizingInformation sizeInformation,
  }) {
    return BlocBuilder<PromoCodeBloc, PromoCodeState>(
      builder: (context, state) {
        promoCodeController.text =
            state.bookingSessionDetailModel?.bookingSessionDeatils?.Promocode ??
                "";
        return Container(
          color: AppColors.backgroundColor3,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //!------Amount details container-------!
              AmountDetails(state: state, eventInfo: eventInfo),
              //!------payable amount container-------!
              Padding(
                  padding: EdgeInsets.only(
                    left: getValueForScreenType(
                      context: context,
                      mobile: 20,
                      desktop: 30,
                    ),
                    right: 40,
                  ),
                  child: PayableAmount(state: state)),
              // //!------Promo code container-------!
              Padding(
                padding: EdgeInsets.only(
                  left: getValueForScreenType(
                    context: context,
                    mobile: 20,
                    desktop: 30,
                  ),
                  right: 40,
                ),
                child: PromoCode(
                  promoCodeController: promoCodeController,
                ),
              ),

              KDimension().kHeight40,
              // //!------button section----------------!
              Container(
                padding: EdgeInsets.only(
                  left: getValueForScreenType(
                    context: context,
                    mobile: 20,
                    desktop: 30,
                  ),
                  right: getValueForScreenType(
                    context: context,
                    mobile: 20,
                    desktop: 40,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PreviousButton(
                      index: 4,
                      sizingInformation: sizeInformation,
                    ),
                    PromoBottomButton(
                      promoCodeController: promoCodeController,
                    ),
                  ],
                ),
              ),

              KDimension().kHeight10,
            ],
          ),
        );
      },
    );
  }
}
