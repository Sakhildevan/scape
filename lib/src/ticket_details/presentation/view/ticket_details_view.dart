import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_func.dart';
import 'package:scape/core/utils/common_widgets/background_widget.dart';
import 'package:scape/core/utils/common_widgets/custom_image_network_widget.dart';
import 'package:scape/core/utils/common_widgets/custom_view/app_bar_logo.dart';
import 'package:scape/core/utils/common_widgets/custom_view/footer.dart';
import 'package:scape/core/utils/common_widgets/event_desc_with_scroll.dart';
import 'package:scape/core/utils/common_widgets/event_desc_without_scroll.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/ticket_details/presentation/custom-pdf-generation/custom_export_delegate.dart';
import 'package:scape/src/ticket_details/presentation/view/participant_view.dart';

import '../../../../core/utils/common_widgets/error_view.dart';
import '../../../../core/utils/common_widgets/loading_widgets/initial_loader.dart';
import '../bloc/ticket_details_bloc.dart';

class TicketDetailsView extends StatefulWidget {
  final String ticketCode;
  const TicketDetailsView({super.key, required this.ticketCode});

  @override
  State<TicketDetailsView> createState() => _TicketDetailsViewState();
}

class _TicketDetailsViewState extends State<TicketDetailsView> {
  @override
  void initState() {
    context
        .read<TicketDetailsBloc>()
        .add(FetchTicket(ticketCode: widget.ticketCode));
    exportDelegate = CustomExportDelegate(_contentKey);
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

  late CustomExportDelegate exportDelegate;
  final GlobalKey _contentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ResponsiveBuilder(
        builder: (
          BuildContext context,
          SizingInformation sizingInformation,
        ) =>
            BlocBuilder<TicketDetailsBloc, TicketDetailsState>(
          // buildWhen: (previous, current) {
          //   logger.e(current.apiStatus);
          //   return current.apiStatus == ApiStatus.loading ||
          //       current.apiStatus == ApiStatus.failure ||
          //       current.apiStatus == ApiStatus.success;
          // },
          builder: (context, state) {
            return state.initialApiStatus == ApiStatus.loading
                ? const InitialLoader()
                : state.initialApiStatus == ApiStatus.failure
                    ? ErrorView(
                        errorMessage: state.errorMessage,
                        tryAgain: () => context.read<TicketDetailsBloc>().add(
                              FetchTicket(
                                ticketCode: widget.ticketCode,
                              ),
                            ),
                      )
                    : state.initialApiStatus == ApiStatus.success
                        ? _buildBody(sizingInformation)
                        : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

//Build Body
  Widget _buildBody(SizingInformation sizeInformation) {
    return ExportFrame(
      frameId: StringConst.captureFrameId,
      exportDelegate: exportDelegate,
      child: Container(
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
                  Expanded(child: _buildContent()),
                ],
              ),
            ),
            if (!sizeInformation.isMobile) const Footer(),
          ],
        ),
      ),
    );
  }

  //Content
  Widget _buildContent() {
    return BackgroundWidget(
        content: KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: (KeyEvent event) {
        keyboardScrollEvent(event, _pageScrollController);
      },
      child: SingleChildScrollView(
        controller: _pageScrollController,
        child: RepaintBoundary(
          key: _contentKey,
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KDimension().kHeight20,
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Constants.width * 0.1),
                    child:
                        _topCoverImageRow(sizeInformation: sizingInformation)),
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 30.0),
                //   child: DottedSeparator(
                //     height: 2,
                //   ),
                // ),
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
                    child: BlocBuilder<TicketDetailsBloc, TicketDetailsState>(
                      builder: (context, state) {
                        String specialInstructions = state.ticketModel.ticket
                                ?.ticketSpecialInstructions ??
                            "";
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ParticipantsView(
                              exportDelegate: exportDelegate,
                              sizingInformation: sizingInformation,
                              eventName:
                                  state.ticket.firstOrNull?.ticket?.eventName ??
                                      "",
                            ),
                            if (specialInstructions.isNotEmpty)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getValueForScreenType(
                                    context: context,
                                    mobile: 0,
                                    tablet: 25,
                                    desktop: 50,
                                  ),
                                ),
                                child: Column(
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
                              ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getValueForScreenType(
                                  context: context,
                                  mobile: 0,
                                  tablet: 25,
                                  desktop: 50,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Kstyles().bold(
                                    text: StringConst
                                        .generalTicketingTermsConditions,
                                    size: 24,
                                  ),
                                  KDimension().kHeight20,
                                  HtmlWidget(
                                    ''' ${state.ticketModel.ticket?.ticketTermsAndConditions?.replaceAll('&lt;', '<').replaceAll('&gt;', '>').replaceAll('&quot;', '"').replaceAll('&amp;', '&') ?? ''} ''',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                KDimension().kHeight30,
                if (sizingInformation.isMobile) const Footer(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

//Top cover image row widget
  Widget _topCoverImageRow({required SizingInformation sizeInformation}) {
    return BlocBuilder<TicketDetailsBloc, TicketDetailsState>(
      builder: (context, state) {
        var ticket = state.ticket.firstOrNull?.ticket;

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
                      state.ticket.firstOrNull?.ticket?.eventDescription ?? "",
                      state.ticket.firstOrNull?.ticket?.eventName ?? "",
                      sizeInformation,
                    ),
                  ],
                )
              : SizedBox(
                  // height: 240,
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
                            state.ticket.firstOrNull?.ticket
                                    ?.eventDescription ??
                                "",
                            state.ticket.firstOrNull?.ticket?.eventName ?? "",
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

  // Widget _billingInfoSection({required SizingInformation sizeInformation}) {
  //   return sizeInformation.isTablet || sizeInformation.isMobile
  //       ? Column(
  //           children: [
  //             const BillingInfo(),
  //             KDimension().kHeight20,
  //             const TotalPayable()
  //           ],
  //         )
  //       : const Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             BillingInfo(
  //               isExpandedNeeds: true,
  //             ),
  //             TotalPayable(
  //               isExpandedNeeds: true,
  //             )
  //           ],
  //         );
  // }
}
