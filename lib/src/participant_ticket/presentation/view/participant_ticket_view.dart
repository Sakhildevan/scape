import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_func.dart';
import 'package:scape/core/utils/common_widgets/custom_image_network_widget.dart';
import 'package:scape/core/utils/common_widgets/event_desc_with_scroll.dart';
import 'package:scape/core/utils/common_widgets/event_desc_without_scroll.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/participant_ticket/presentation/bloc/participant_ticket_bloc.dart';

import '../../../../core/utils/common_widgets/background_widget.dart';
import '../../../../core/utils/common_widgets/custom_view/app_bar_logo.dart';
import '../../../../core/utils/common_widgets/custom_view/footer.dart';
import '../../../../core/utils/common_widgets/error_view.dart';
import '../../../../core/utils/common_widgets/loading_widgets/initial_loader.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../../../core/utils/styles/dimensions.dart';
import '../../../../core/utils/styles/text_styles.dart';
import '../../../ticket_details/presentation/bloc/ticket_details_bloc.dart';
import 'sub_widgets/participant_ticket.dart';

class ParticipantTicketView extends StatefulWidget {
  final String ticketCode;
  const ParticipantTicketView({super.key, required this.ticketCode});

  @override
  State<ParticipantTicketView> createState() => _ParticipantTicketViewState();
}

class _ParticipantTicketViewState extends State<ParticipantTicketView> {
  @override
  void initState() {
    context
        .read<ParticipantTicketBloc>()
        .add(ParticipantTicketDetails(ticketCode: widget.ticketCode));
    // context.read<TicketDetailsBloc>().add(const GetStaticPage());
    _focusNode = FocusNode();

    // Request focus when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _pageScrollController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  late FocusNode _focusNode;
  final ScrollController _pageScrollController = ScrollController();
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ResponsiveBuilder(
        builder: (
          BuildContext context,
          SizingInformation sizingInformation,
        ) =>
            BlocBuilder<ParticipantTicketBloc, ParticipantTicketState>(
          builder: (context, state) {
            return state.apiStatus == ApiStatus.loading
                ? const InitialLoader()
                : state.apiStatus == ApiStatus.failure
                    ? ErrorView(
                        errorMessage: state.errorMsg,
                        tryAgain: () => context
                            .read<ParticipantTicketBloc>()
                            .add(ParticipantTicketDetails(
                                ticketCode: widget.ticketCode)),
                      )
                    : state.apiStatus == ApiStatus.success
                        ? _buildBody(context, state, sizingInformation)
                        : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

//Build Body
  Widget _buildBody(
    BuildContext context,
    ParticipantTicketState state,
    SizingInformation sizeInformation,
  ) {
    return Container(
      height: Constants.height,
      color: AppColors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarLogo(
                    isFromProfile: true,
                    showLogout: false,
                  ),
                  Expanded(child: _buildContent(context, state)),
                ]),
          ),
          if (!sizeInformation.isMobile) const Footer(),
        ],
      ),
    );
  }

  //Content
  Widget _buildContent(
    BuildContext context,
    ParticipantTicketState state,
  ) {
    String specialInstructions = state.participantTicketModel.participantTicket
            ?.ticketSpecialInstructions ??
        "";
    return BackgroundWidget(
        content: KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: (KeyEvent event) {
        keyboardScrollEvent(event, _pageScrollController);
      },
      child: SingleChildScrollView(
        controller: _pageScrollController,
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KDimension().kHeight60,
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Constants.width * 0.1),
                child: _topCoverImageRow(
                  sizeInformation: sizingInformation,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Constants.width * 0.1),
                child: Container(
                  color: AppColors.white,
                  margin: EdgeInsets.symmetric(
                      horizontal: getValueForScreenType(
                          context: context, mobile: 20, desktop: 40)),
                  padding: EdgeInsets.only(
                      top: getValueForScreenType(
                          context: context, mobile: 20, desktop: 20),
                      left: getValueForScreenType(
                          context: context, mobile: 20, desktop: 40),
                      right: getValueForScreenType(
                          context: context, mobile: 20, desktop: 40),
                      bottom: getValueForScreenType(
                          context: context, mobile: 10, desktop: 20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ParticipantTicketDetailsView(),
                      if (specialInstructions.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KDimension().kHeight20,
                            Kstyles().bold(
                              text: StringConst.specialInstructions,
                              size: 24,
                            ),
                            KDimension().kHeight20,
                            HtmlWidget(
                              ''' ${specialInstructions.replaceAll('&lt;', '<').replaceAll('&gt;', '>').replaceAll('&quot;', '"').replaceAll('&amp;', '&')} ''',
                              textStyle: GoogleFonts.openSans(),
                            ),
                          ],
                        ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Kstyles().bold(
                            text: StringConst.generalTicketingTermsConditions,
                            size: 24,
                          ),
                          KDimension().kHeight20,
                          HtmlWidget(
                            ''' ${state.participantTicketModel.participantTicket?.ticketTermsAndConditions?.replaceAll('&lt;', '<').replaceAll('&gt;', '>').replaceAll('&quot;', '"').replaceAll('&amp;', '&') ?? ''} ''',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              KDimension().kHeight30,
              if (sizingInformation.isMobile) const Footer(),
            ],
          ),
        ),
      ),
    ));
  }

//Top cover image row widget
  Widget _topCoverImageRow({required SizingInformation sizeInformation}) {
    return BlocBuilder<ParticipantTicketBloc, ParticipantTicketState>(
      builder: (context, state) {
        var ticket = state.ticketList.firstOrNull?.participantTicket;
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: getValueForScreenType(
                context: context, mobile: 20, desktop: 40),
          ),
          child: sizeInformation.isTablet || sizeInformation.isMobile
              ? Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ticket?.bannerUrl ?? "",
                        width: 550,
                        fit: BoxFit.fill,
                      ),
                    ),
                    KDimension().kHeight20,
                    _topRightTextSection(
                      state.ticketList.firstOrNull?.participantTicket
                              ?.eventDescription ??
                          "",
                      state.ticketList.firstOrNull?.participantTicket
                              ?.eventName ??
                          "",
                      sizeInformation,
                    ),
                  ],
                )
              : SizedBox(
                  // height: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CustomImageNetworkWidget(
                          imageUrl: ticket?.bannerUrl ?? "",
                          height: 200,
                          boxFit: BoxFit.fill,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: Constants.width * 0.028,
                            right: Constants.width * 0.04,
                            bottom: 5,
                          ),
                          child: _topRightTextSection(
                            state.ticketList.firstOrNull?.participantTicket
                                    ?.eventDescription ??
                                "",
                            state.ticketList.firstOrNull?.participantTicket
                                    ?.eventName ??
                                "",
                            sizeInformation,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  // var ticket = state.ticket.firstOrNull?.ticket;

  Widget _topRightTextSection(
    String description,
    String eventName,
    SizingInformation sizeInformation,
  ) {
    return LayoutBuilder(builder: (context, constraints) {
      bool didExceedMaxLines =
          didExceedTextMaxLines(description, constraints.maxWidth);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if (sizeInformation.isDesktop) KDimension().kHeight10,
          Kstyles().bold(
            text: eventName,
            maxLines: 2,
            size: getValueForScreenType(
              context: context,
              mobile: 18,
              desktop: 26,
            ),
          ),
          SizedBox(
            height: Constants.width * 0.01,
          ),
          sizeInformation.isMobile || sizeInformation.isTablet
              ? _eventDescriptionVisible(description)
              : !didExceedMaxLines
                  ? _eventDescriptionVisible(description)
                  : SizedBox(
                      width: constraints.maxWidth,
                      child: BlocBuilder<TicketDetailsBloc, TicketDetailsState>(
                        builder: (context, state) {
                          bool isExpand = false;
                          isExpand = state.isExpandedText;

                          return isExpand
                              ? SizedBox(
                                  height: 140,
                                  child: EventDescWithScroll(
                                      description: description,
                                      onTap: () {
                                        context.read<TicketDetailsBloc>().add(
                                            const ToggleTextExpandEvent(true));
                                      },
                                      scrollController: scrollController),
                                )
                              : SizedBox(
                                  height: 80,
                                  child: EventDescWithoutScroll(
                                      description: description,
                                      onTap: () {
                                        context.read<TicketDetailsBloc>().add(
                                            const ToggleTextExpandEvent(false));
                                      }),
                                );
                        },
                      ),
                    ),
        ],
      );
    });
  }

  Widget _eventDescriptionVisible(String value) {
    return Kstyles().med(
      text: value,
      size: 14,
      overflow: TextOverflow.visible,
    );
  }
}
