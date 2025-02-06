import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/core/utils/ticket_clipper.dart';
import 'package:scape/src/ticket_details/presentation/bloc/ticket_details_bloc.dart';
import 'package:scape/src/ticket_details/presentation/view/widgets/qr_image_widget.dart';
import 'package:shimmer/shimmer.dart';

class ParticipantCard extends StatefulWidget {
  final int participantNumber;
  final String name;
  final String bookingReference;
  final String packageName;
  final String qrCode;
  final bool isDynamicQrCode;
  final List venues;
  // final String dateTime;

  const ParticipantCard({
    super.key,
    required this.participantNumber,
    required this.name,
    required this.packageName,
    required this.qrCode,
    required this.venues,
    required this.isDynamicQrCode,
    required this.bookingReference,
    // required this.dateTime,
  });

  @override
  State<ParticipantCard> createState() => _ParticipantCardState();
}

class _ParticipantCardState extends State<ParticipantCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.1,
            blurRadius: 20,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipPath(
        clipper: TicketClipper(radius: 25, division: 1.7),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: AppColors.ticketBg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getValueForScreenType(
                  context: context,
                  mobile: _participantName(context),
                  tablet: _participantName(context),
                  desktop: SizedBox(
                    // width: Constants.width > 1440 ? 900 : 800,
                    child: _participantName(context),
                  ),
                ),
                // KDimension().kHeight20,
                ResponsiveBuilder(builder: (context, sizingInformation) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: sizingInformation.isMobile ||
                            sizingInformation.isTablet
                        ? SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: _buildParticipantLeftWidget(context),
                                ),
                                KDimension().kHeight20,
                                widget.isDynamicQrCode == true
                                    ? _getQrBtn(
                                        sizingInformation,
                                        context,
                                        widget.bookingReference,
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          QRImageWidget(
                                            value: widget.qrCode,
                                            size: 150,
                                            logoSize: 30,
                                            textSize: 7,
                                          ),
                                          // CustomImageNetworkWidget(
                                          //   imageUrl:
                                          //       'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=$qrCode',
                                          //   width: 150,
                                          //   height: 150,
                                          //   boxFit: BoxFit.cover,
                                          // ),
                                        ],
                                      ),
                              ],
                            ),
                          )
                        : Container(
                            // width: Constants.width > 1440 ? 900 : 800,
                            padding: EdgeInsets.symmetric(
                                horizontal: Constants.width * 0.045),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: _buildParticipantLeftWidget(context),
                                ),

                                widget.isDynamicQrCode == true
                                    ? _getQrBtn(
                                        sizingInformation,
                                        context,
                                        widget.bookingReference,
                                      )
                                    : QRImageWidget(
                                        value: widget.qrCode,
                                        size: 180,
                                        logoSize: 40,
                                        textSize: 9,
                                      ),
                                // CustomImageNetworkWidget(
                                //   imageUrl:
                                //       'https://api.qrserver.com/v1/create-qr-code/?size=180x180&data=$qrCode',
                                //   width: 180,
                                //   height: 180,
                                //   boxFit: BoxFit.cover,
                                // ),
                                SizedBox(
                                  width: getValueForScreenType(
                                    context: context,
                                    mobile: 10,
                                    tablet: 15,
                                    desktop: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  );
                }),
                KDimension().kHeight10,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getQrBtn(
    SizingInformation sizingInformation,
    BuildContext context,
    String bookingReference,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        right: getValueForScreenType(
          context: context,
          mobile: 10,
          tablet: 20,
          desktop: 30,
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.all(sizingInformation.isMobile ? 15 : 20),
          ),
          backgroundColor: const WidgetStatePropertyAll(AppColors.white),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              side: BorderSide(color: AppColors.orange),
              // borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return QrCodeDialog(
                bookingReference: bookingReference,
                sizingInformation: sizingInformation,
              );
            },
          );
        },
        child: Kstyles().semibold(
          text: "GET QR CODE",
          color: AppColors.orange,
          size: 14,
        ),
      ),
    );
  }

  Widget _participantName(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColors.orange,
      ),
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Kstyles().bold(
          text: 'Participant ${widget.participantNumber} : ${widget.name}',
          color: AppColors.white,
          maxLines: 4,
          size: getValueForScreenType(
            context: context,
            mobile: 24,
            desktop: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildParticipantLeftWidget(BuildContext context) {
    // String? qrCodeString;
    // var stringList = widget.qrCode.split("=").toList();
    // if (stringList.length > 1) {
    //   qrCodeString = stringList[1];
    // }
    return Container(
      padding: EdgeInsets.only(
        left: getValueForScreenType(
          context: context,
          mobile: 10,
          tablet: 20,
          desktop: 30,
        ),
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Kstyles().bold(
                text: "Category: ${widget.packageName}",
                color: AppColors.black,
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
                maxLines: 4,
                size: getValueForScreenType(
                  context: context,
                  mobile: 20,
                  desktop: 22,
                ),
              ),
              KDimension().kHeight05,
              Kstyles().bold(
                  text: "Date, Time & Venue",
                  color: AppColors.black,
                  size: getValueForScreenType(
                    context: context,
                    mobile: 14,
                    desktop: 16,
                  ),
                  textAlign: TextAlign.start),
            ],
          ),
          KDimension().kHeight05,
          // KDimension().kHeight10,
          // const Divider(
          //   color: AppColors.orange,
          // ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.venues
                .asMap()
                .entries
                .map((item) => SizedBox(
                      width: getValueForScreenType(
                        context: context,
                        mobile: double.infinity,
                        tablet: double.infinity,
                        desktop: double.infinity,
                      ),
                      child: Kstyles().reg(
                        textAlign: TextAlign.start,
                        text: item.value,
                        maxLines: 3,
                        color: AppColors.black,
                        size: getValueForScreenType(
                          context: context,
                          mobile: 14,
                          desktop: 16,
                        ),
                      ),
                    ))
                .toList(),
          ),
          KDimension().kHeight05,

          Kstyles().bold(
            text: "Ticket No: ${widget.bookingReference}",
            color: AppColors.orange,
            maxLines: 3,
            size: getValueForScreenType(
              context: context,
              mobile: 16,
              desktop: 18,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

class QrCodeDialog extends StatelessWidget {
  const QrCodeDialog(
      {super.key,
      required this.bookingReference,
      required this.sizingInformation});
  final String bookingReference;
  final SizingInformation sizingInformation;

  @override
  Widget build(BuildContext context) {
    context
        .read<TicketDetailsBloc>()
        .add(GetDynamicTicketEvent(referenceCode: bookingReference));
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        scrollable: false,
        contentPadding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        backgroundColor: AppColors.white,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: sizingInformation.isDesktop ? 600 : 350,
              width: sizingInformation.isDesktop ? 550 : 300,
              padding: EdgeInsets.symmetric(
                horizontal: getValueForScreenType(
                  context: context,
                  mobile: 10,
                  tablet: 15,
                  desktop: 20,
                ),
                vertical: getValueForScreenType(
                  context: context,
                  mobile: 10,
                  tablet: 10,
                  desktop: 20,
                ),
              ),
              child: Center(
                // Added Center widget here
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    // Added ConstrainedBox for minimum height
                    constraints: BoxConstraints(
                      minHeight: sizingInformation.isDesktop
                          ? 560
                          : 310, // Height minus padding
                    ),
                    child: Center(
                      // Added another Center for Column alignment
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center vertically
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Center horizontally
                        children: [
                          BlocBuilder<TicketDetailsBloc, TicketDetailsState>(
                            builder: (context, state) {
                              String url = state.dynamicTicketModel
                                      ?.DynamicParticipantTicketURL ??
                                  "";
                              String? qrCodeString;
                              var stringList = url.split("=").toList();
                              if (stringList.length > 1) {
                                qrCodeString = stringList[1];
                              }
                              return state.apiStatus == ApiStatus.loading
                                  ? Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        height: sizingInformation.isDesktop
                                            ? 250
                                            : 180,
                                        width: sizingInformation.isDesktop
                                            ? 250
                                            : 180,
                                        color: Colors.grey,
                                      ),
                                    )
                                  : state.apiStatus == ApiStatus.failure
                                      ? SizedBox(
                                          height: 180,
                                          width: 180,
                                          child: Center(
                                            child: Kstyles().semibold(
                                              textAlign: TextAlign.center,
                                              text: "Unable to load",
                                              maxLines: 3,
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              size: 14,
                                            ),
                                          ),
                                        )
                                      : state.apiStatus == ApiStatus.success
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Kstyles().semibold(
                                                  text: "$qrCodeString",
                                                  color: AppColors.orange,
                                                  size: sizingInformation
                                                          .isDesktop
                                                      ? 22
                                                      : 18,
                                                ),
                                                KDimension().kHeight30,
                                                QRImageWidget(
                                                  value: state
                                                          .dynamicTicketModel
                                                          ?.DynamicParticipantTicketURL ??
                                                      "",
                                                  size: sizingInformation
                                                          .isDesktop
                                                      ? 250
                                                      : 180,
                                                  logoSize: sizingInformation
                                                          .isDesktop
                                                      ? 60
                                                      : 40,
                                                  textSize: sizingInformation
                                                          .isDesktop
                                                      ? 10
                                                      : 9,
                                                ),
                                              ],
                                            )
                                          : const SizedBox.shrink();
                            },
                          ),
                          KDimension().kHeight20,
                          BlocBuilder<TicketDetailsBloc, TicketDetailsState>(
                            builder: (context, state) {
                              if (state.timerStatus == TIMER.running) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Kstyles().semibold(
                                      text: "QR code expires in:",
                                      color: AppColors.black.withOpacity(0.7),
                                      size:
                                          sizingInformation.isDesktop ? 18 : 16,
                                    ),
                                    KDimension().kHeight05,
                                    Kstyles().semibold(
                                      text:
                                          _formatDuration(state.timerDuration),
                                      color: AppColors.orange,
                                      size:
                                          sizingInformation.isDesktop ? 22 : 18,
                                    ),
                                  ],
                                );
                              } else if (state.timerStatus == TIMER.complete) {
                                return Kstyles().semibold(
                                  text: "QR code has been expired",
                                  color: AppColors.red.withOpacity(0.9),
                                  size: sizingInformation.isDesktop ? 16 : 14,
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            _closeBtn(context),
          ],
        ),
      ),
    );
  }

  //close icon
  Widget _closeBtn(BuildContext context) {
    return Positioned(
      right: 10,
      top: 10,
      child: IconButton(
        icon: Icon(
          Icons.close,
          color: AppColors.red,
          size: getValueForScreenType(
            context: context,
            mobile: 20,
            tablet: 25,
            desktop: 35,
          ),
        ),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

String _formatDuration(int totalSeconds) {
  final minutes = totalSeconds ~/ 60;
  final seconds = totalSeconds % 60;
  return '$minutes:${seconds.toString().padLeft(2, '0')}';
}
