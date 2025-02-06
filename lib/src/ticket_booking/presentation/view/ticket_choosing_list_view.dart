import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/asset_constants.dart';
import 'package:scape/core/utils/common_widgets/custom_text.dart';
import 'package:scape/core/utils/dotted_separator.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/font_constants.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/core/utils/ticket_clipper.dart';
import 'package:scape/src/ticket_booking/data/model/get_event_with_package_limit/get_event_with_package_limit_model.dart';
import 'package:scape/src/ticket_booking/presentation/bloc/ticket_booking_bloc.dart';

class TicketChoosingListView extends StatefulWidget {
  final bool showParticipantField;
  final List<EventPackageWithLimit> eventPackageList;
  final TicketBookingState state;

  const TicketChoosingListView({
    super.key,
    required this.showParticipantField,
    required this.eventPackageList,
    required this.state,
  });

  @override
  State<TicketChoosingListView> createState() => _TicketChoosingListViewState();
}

class _TicketChoosingListViewState extends State<TicketChoosingListView> {
  @override
  Widget build(BuildContext context) {
    return _buildContent(context: context);
  }

  Widget _buildContent({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          widget.eventPackageList.length,
          (ticketIndex) {
            return (widget.eventPackageList[ticketIndex].PackageLimit ?? 0) == 0
                ? const SizedBox()
                : _buildPackageItem(context, ticketIndex);
          },
        ),
      ],
    );
  }

//Build event item widget
  Widget _buildPackageItem(
    BuildContext context,
    int ticketIndex,
  ) {
    final availableTickets = widget.eventPackageList
        .where((package) => (package.PackageLimit ?? 0) > 0)
        .toList();

    // Get the index in the available tickets list
    final availableIndex = availableTickets.indexWhere((package) =>
        package.EventPackageCode ==
        widget.eventPackageList[ticketIndex].EventPackageCode);

    // If only one ticket, don't apply any clipping
    if (availableTickets.length == 1) {
      return _packageItemContent(context, ticketIndex);
    }

    // For multiple tickets
    if (availableIndex == 0) {
      // First ticket - only bottom clips
      return ClipPath(
        clipper: BottomCornersTicketClipper(),
        child: _packageItemContent(context, ticketIndex),
      );
    } else if (availableIndex == availableTickets.length - 1) {
      // Last ticket - only top clips
      return ClipPath(
        clipper: TopCornersTicketClipper(),
        child: _packageItemContent(context, ticketIndex),
      );
    } else {
      // Middle tickets - both top and bottom clips
      return ClipPath(
        clipper: TopBottomTicketClipper(),
        child: _packageItemContent(context, ticketIndex),
      );
    }
  }

  Container _packageItemContent(
    BuildContext context,
    int ticketIndex,
  ) {
    return Container(
      color: AppColors.backgroundColor3,
      padding: EdgeInsets.symmetric(
        horizontal: getValueForScreenType(
          context: context,
          mobile: 20,
          desktop: 30,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (ticketIndex != 0)
            const DottedSeparator(
              height: 2,
            ),
          _itemInformation(context, ticketIndex),
          if (widget.showParticipantField)
            _participantInputFields(context, ticketIndex),
          KDimension().kHeight30,
        ],
      ),
    );
  }

  //Build participant input fields section
  Widget _participantInputFields(BuildContext context, int ticketIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KDimension().kHeight10,
        Visibility(
          visible: widget.state.nameControllers[ticketIndex].isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Kstyles().bold(
              text: "Participant Details",
              size: getValueForScreenType(
                context: context,
                mobile: 14,
                desktop: 16,
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.state.nameControllers[ticketIndex].isNotEmpty,
          child: widget.state.nameControllers[ticketIndex].length >= 2
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info,
                        size: 20,
                        color: AppColors.orange,
                      ),
                      KDimension().kWidth05,
                      Expanded(
                        child: Kstyles().med(
                          text: StringConst.multipleParticipantNoticeText,
                          size: 14,
                          maxLines: 5,
                          color: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Kstyles().med(
                    text: StringConst.participantNoticeText,
                    size: 14,
                    color: AppColors.orange,
                  ),
                ),
        ),
        ...List.generate(widget.state.nameControllers[ticketIndex].length,
            (participantIndex) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Kstyles().med(
                    text: "Participant ${participantIndex + 1}",
                    color: AppColors.black,
                    size: 14,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        String code = "";

                        int index = widget.state.bookedPackages!.indexWhere(
                          (item) =>
                              item.EventPackageCode ==
                              widget.state.eventInfoWithLimit!.eventSettings!
                                  .EventPackages![ticketIndex].EventPackageCode,
                        );
                        print(index);
                        code = widget
                                .state
                                .bookedPackages?[index]
                                .Participants?[participantIndex]
                                .ParticipantCode ??
                            "";
                        print(code);
                        context.read<TicketBookingBloc>().add(DeleteParticipant(
                              participantCode: code,
                              context: context,
                              ticketIndex: ticketIndex,
                              participantIndex: participantIndex,
                            ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.delete,
                          size: 25,
                          color: AppColors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              KDimension().kHeight10,
              _buildInputField(
                widget.state.nameControllers[ticketIndex][participantIndex],
                StringConst.enterName,
                (val) {},
                TextInputType.text,
                (widget.eventPackageList[ticketIndex].UserRestriction == 1 ||
                            widget.eventPackageList[ticketIndex]
                                    .UserRestriction ==
                                2) &&
                        participantIndex == 0
                    ? true
                    : false,
              ),
              KDimension().kHeight15,
              _buildInputField(
                widget.state.emailControllers[ticketIndex][participantIndex],
                StringConst.enterEmail,
                (val) {},
                TextInputType.emailAddress,
                (widget.eventPackageList[ticketIndex].UserRestriction == 1 ||
                            widget.eventPackageList[ticketIndex]
                                    .UserRestriction ==
                                2) &&
                        participantIndex == 0
                    ? true
                    : false,
              ),
              KDimension().kHeight10,
            ],
          );
        }),
        widget.eventPackageList[ticketIndex].PackageLimit != 0
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    context.read<TicketBookingBloc>().add(AddEmptyParticipant(
                          eventPackageCode: widget.eventPackageList[ticketIndex]
                                  .EventPackageCode ??
                              "",
                          context: context,
                          ticketIndex: ticketIndex,
                        ));
                  },
                  child: Kstyles().bold(
                    text:
                        "+ Add ${widget.state.nameControllers[ticketIndex].isEmpty ? "participant" : "more"}",
                    color: AppColors.orange,
                    size: getValueForScreenType(
                      context: context,
                      mobile: 14,
                      desktop: 16,
                    ),
                  ),
                ),
              )
            : Kstyles().semibold(
                text: StringConst.ticketFullMessage(
                    widget.eventPackageList[ticketIndex].PackageName ?? ""),
                color: AppColors.red,
                size: 12,
              ),
        KDimension().kHeight20,
      ],
    );
  }

  //Build input field
  Widget _buildInputField(
    TextEditingController controller,
    String hint,
    Function(String) onChanged,
    TextInputType keyBoardType,
    bool readOnly,
  ) {
    return CustomWidgets.commonTextField(
      textEditingController: controller,
      backgroundColor: AppColors.white,
      hintText: hint,
      keyBoardType: keyBoardType,
      readOnly: readOnly,
      hintTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: AppColors.grey,
      ),
      borderColor: AppColors.transparent,
      onSubmitted: (val) {},
      onChanged: onChanged,
    );
  }

//Build item information
  Widget _itemInformation(BuildContext context, int ticketIndex) {
    double price =
        double.tryParse(widget.eventPackageList[ticketIndex].Price ?? "0") ??
            0.0;
    bool isFree = price <= 0 ? true : false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (ticketIndex != 0) KDimension().kHeight30,
        _itemTop(context, ticketIndex),
        // if (!isFree) KDimension().kHeight05,
        // Kstyles().med(
        //   text:
        //       "Max available tickets for you: ${widget.eventPackageList[ticketIndex].PackageLimit ?? "0"}",
        //   color: AppColors.black,
        //   maxLines: 5,
        //   size: getValueForScreenType(
        //     context: context,
        //     mobile: 14,
        //     desktop: 16,
        //   ),
        // ),
        if (!isFree) KDimension().kHeight10,
        if (!isFree) _itemTicketCost(context, ticketIndex),
        KDimension().kHeight10,
        _itemVenues(context, ticketIndex),
      ],
    );
  }

//Build Item heading
  Widget _itemTop(
    BuildContext context,
    int ticketIndex,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: widget.showParticipantField
                  ? getValueForScreenType(
                      context: context,
                      mobile: 15,
                      desktop: 25,
                    )
                  : 0,
            ),
            child: Kstyles().bold(
              text:
                  "Category: ${widget.eventPackageList[ticketIndex].PackageName ?? ""}",
              color: AppColors.black,
              maxLines: 5,
              size: getValueForScreenType(
                context: context,
                mobile: 14,
                desktop: 16,
              ),
            ),
          ),
        ),
        if (!widget.showParticipantField)
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: _qtyButtons(context, ticketIndex),
          ),
      ],
    );
  }

  Widget _qtyButtons(BuildContext context, int ticketIndex) {
    return SizedBox(
      width: 110,
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: AppColors.grey,
              shape: BoxShape.rectangle,
            ),
            child: IconButton(
              icon: const Icon(Icons.remove, color: Colors.white),
              padding: EdgeInsets.zero,
              onPressed: () {
                context.read<TicketBookingBloc>().add(
                      UpdateTicketQty(
                        isIncrement: false,
                        ticketIndex: ticketIndex,
                        participantIndex: -1,
                        context: context,
                      ),
                    );
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Kstyles().bold(
                text: "${widget.state.qtyList[ticketIndex]}",
                color: AppColors.black,
                size: getValueForScreenType(
                  context: context,
                  mobile: 14,
                  desktop: 16,
                ),
              ),
            ),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: AppColors.orange,
              shape: BoxShape.rectangle,
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              padding: EdgeInsets.zero,
              onPressed: () {
                context.read<TicketBookingBloc>().add(
                      UpdateTicketQty(
                        isIncrement: true,
                        ticketIndex: ticketIndex,
                        participantIndex: -1,
                        context: context,
                      ),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }

//Build Item ticket cost
  Widget _itemTicketCost(
    BuildContext context,
    int i,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AssetsConst.ticketIcon,
              width: 22,
              height: 22,
              fit: BoxFit.contain,
            ),
            KDimension().kWidth10,
            Kstyles().bold(
              text: "Price:",
              color: AppColors.black,
              size: 14,
            ),
          ],
        ),
        KDimension().kHeight05,
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: RichText(
            text: TextSpan(
              text: "\$${widget.eventPackageList[i].Price} ",
              style: GoogleFonts.openSans(
                  fontSize: 14,
                  color: AppColors.orange,
                  fontWeight: FontConst().boldFont),
              children: <TextSpan>[
                TextSpan(
                  text: StringConst.perTicket,
                  style: GoogleFonts.openSans(
                      color: AppColors.black,
                      fontWeight: FontConst().regularFont),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

//Build Item ticket Venues
  Widget _itemVenues(
    BuildContext context,
    int i,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.calendar_month_outlined,
              size: 22,
              color: AppColors.black,
            ),
            KDimension().kWidth10,
            Kstyles().bold(
              text: "Date, Time & Venues:",
              color: AppColors.black,
              size: 14,
            ),
          ],
        ),
        KDimension().kHeight05,
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                widget.eventPackageList[i].Venues?.length ?? 0,
                (venueIndex) {
                  return Kstyles().med(
                    text: widget.eventPackageList[i].Venues?[venueIndex] ?? "",
                    size: 14,
                    color: AppColors.black,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
