import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/common_widgets/custom_image_network_widget.dart';
import 'package:scape/core/utils/common_widgets/custom_view/animated_button.dart';
import 'package:scape/core/utils/common_widgets/custom_view/custom_view.dart';
import 'package:scape/core/utils/common_widgets/custom_view/previous_btn.dart';
import 'package:scape/core/utils/common_widgets/enquires_view.dart';
import 'package:scape/core/utils/common_widgets/error_view.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/initial_loader.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/popup_loading.dart';
import 'package:scape/core/utils/common_widgets/popup_message_widget.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/email-providing-view/data/model/event-model/event_info_model.dart';
import 'package:scape/src/email-providing-view/presentation/bloc/email_providing_bloc.dart';
import 'package:scape/src/register/presentation/bloc/register_from_event_bloc.dart';
import 'package:scape/src/register/presentation/bloc/register_from_event_event.dart';
import 'package:scape/src/register/presentation/view/widgets/register_from_event_widget.dart';
import 'package:scape/src/registration/presentation/bloc/registration_bloc.dart';

class RegisterFromEventView extends StatefulWidget {
  const RegisterFromEventView({
    super.key,
    required this.email,
  });
  final String? email;
  @override
  State<RegisterFromEventView> createState() => _RegisterFromEventViewState();
}

class _RegisterFromEventViewState extends State<RegisterFromEventView> {
  @override
  void initState() {
    logger.i("Email: ${widget.email}");
    context.read<RegisterFromEventBloc>().add(RegisterFromEventResetEvent());
    WidgetsBinding.instance.addPostFrameCallback((callback) async {
      String eventKey = await GetStorage().read(StringConst.eventKey);
      if (widget.email == null) {
        if (mounted) {
          context.replace("${StringConst.startBookingViewRoute}/$eventKey");
        }
      }
    });
    context.read<EmailProvidingBloc>().add(const GetEventInformation());

    context.read<RegisterFromEventBloc>().add(StoreEmail(
          email: widget.email ?? "",
        ));

    super.initState();
  }

  EventInfoModel eventInfo = const EventInfoModel();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailProvidingBloc, EmailProvidingState>(
      listener: (context, state) {
        if (state.initialApiStatus == ApiStatus.success) {
          eventInfo = state.eventInfo;
        }
      },
      builder: (context, state) {
        return state.initialApiStatus == ApiStatus.loading
            ? const InitialLoader()
            : state.initialApiStatus == ApiStatus.failure
                ? ErrorView(
                    errorMessage: state.errorMessage,
                    tryAgain: () => context
                        .read<EmailProvidingBloc>()
                        .add(const GetEventInformation()),
                  )
                : state.initialApiStatus == ApiStatus.success
                    ? CustomView(
                        isFromProfile: false,
                        showLogout: false,
                        contentWidget: _buildContent(),
                      )
                    : const SizedBox.shrink();
      },
    );
  }

  //Content
  Widget _buildContent() {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegistrationBloc, RegistrationState>(
          listener: (context, state) {
            if (state.apiStatus == ApiStatus.loading) {
              popupLoading(context);
            } else if (state.apiStatus == ApiStatus.completed) {
              context.pop();
            } else if (state.apiStatus == ApiStatus.failure) {
              popupMessageWidget(context, state.errorMessage);
            } else if (state.apiStatus == ApiStatus.success) {
              context.go(StringConst.otpViewRoute, extra: {
                StringConst.emailKey: widget.email,
                StringConst.tempLoginToken: state.tempToken,
                StringConst.isFromRegistrationKey: true,
              });
            }
            // }
          },
        ),
      ],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.1 - 40),
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) => Column(
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
                          _contentBodyRight(sizingInformation),
                          KDimension().kHeight20,
                          const EnquiresView(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 340,
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
                              children: [
                                _contentBodyRight(sizingInformation),
                                KDimension().kHeight20,
                                const EnquiresView(),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
              // Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 40),
              //     child: _noticeSection(data)),
              // KDimension().kHeight30,

              KDimension().kHeight80,
            ],
          ),
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

//Content Body Right Widget
  Widget _contentBodyRight(SizingInformation sizingInformation) {
    return Container(
      color: AppColors.backgroundColor3,
      padding: EdgeInsets.all(
        getValueForScreenType(
          context: context,
          mobile: 20,
          desktop: sizingInformation.screenSize.width > 1000 ? 30 : 15,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Kstyles().semibold(
            text: StringConst.invalidAccountSignUp,
            maxLines: 4,
            size: getValueForScreenType(
              context: context,
              mobile: 16,
              desktop: 18,
            ),
          ),
          KDimension().kHeight20,
          RegistrationFromEventWidget(
            email: widget.email ?? "",
          ),
          KDimension().kHeight35,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PreviousButton(
                index: 11,
                sizingInformation: sizingInformation,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedTextButton(
                    fixedWidth: getValueForScreenType(
                      context: context,
                      mobile: 130,
                      tablet: 150,
                      desktop:
                          sizingInformation.screenSize.width > 1000 ? 170 : 120,
                    ),
                    text: "Sign up".toUpperCase(),
                    showPrefixWidget: true,
                    onPressed: () {
                      context
                          .read<RegisterFromEventBloc>()
                          .add(RegisterFromEventNextBtn(context));
                    },
                    smallDevice: sizingInformation.screenSize.width > 1000
                        ? false
                        : true,
                  )),
            ],
          ),
          KDimension().kHeight15,
        ],
      ),
    );
  }
}
