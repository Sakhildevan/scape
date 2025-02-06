import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/asset_constants.dart';
import 'package:scape/core/utils/common_func.dart';
import 'package:scape/core/utils/common_widgets/background_widget.dart';
import 'package:scape/core/utils/common_widgets/custom_text.dart';
import 'package:scape/core/utils/common_widgets/custom_view/app_bar_logo.dart';
import 'package:scape/core/utils/common_widgets/custom_view/footer.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/dotted_separator.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/extensions.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/profile/presentation/bloc/profile_bloc.dart';
import 'dart:html' as html;
import '../../../../core/utils/common_widgets/error_view.dart';
import '../../../../core/utils/common_widgets/loading_widgets/initial_loader.dart';
import '../../../../core/utils/common_widgets/popup_message_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    super.key,
  });

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController addMoreInterest = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      final box = GetStorage();
      String? token = box.read(StringConst.loginTokenKey);
      if (token != null) {
        context.read<ProfileBloc>().add(CheckLoginIsValidEvent());
      } else {
        context.go(StringConst.registrationViewRoute);
      }
    });
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
    // scrollController.dispose();
    super.dispose();
  }

  late FocusNode _focusNode;
  final ScrollController _pageScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ResponsiveBuilder(
        builder: (
          BuildContext context,
          SizingInformation sizingInformation,
        ) =>
            BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state.initialApiStatus == ApiStatus.failure) {
              context.replace(StringConst.registrationViewRoute);
            } else if (state.initialApiStatus == ApiStatus.success) {
            } else if (state is LoginValidState) {
              context.read<ProfileBloc>().add(const FetchTicketList());
            }
          },
          builder: (context, state) {
            return state.initialApiStatus == ApiStatus.loading ||
                    state.apiStatus == ApiStatus.loading
                ? const InitialLoader()
                : state.initialApiStatus == ApiStatus.failure ||
                        state.apiStatus == ApiStatus.failure
                    ? ErrorView(
                        errorMessage: state.errorMessage,
                        tryAgain: () {
                          context
                              .read<ProfileBloc>()
                              .add(CheckLoginIsValidEvent());
                        },
                      )
                    : state.initialApiStatus == ApiStatus.success &&
                            state.apiStatus == ApiStatus.success
                        ? _buildBody(
                            sizeInformation: sizingInformation,
                            context: context)
                        : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

//Build Body
  Widget _buildBody(
      {required SizingInformation sizeInformation,
      required BuildContext context}) {
    return Container(
      height: Constants.height,
      color: AppColors.backgroundColor,
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
                  showLogout: true,
                ),
                Expanded(
                  child: _buildContent(
                      sizeInformation: sizeInformation, context: context),
                ),
              ],
            ),
          ),
          if (!sizeInformation.isMobile) const Footer(),
        ],
      ),
    );
  }

  //Content
  Widget _buildContent(
      {required SizingInformation sizeInformation,
      required BuildContext context}) {
    return BackgroundWidget(
      content: KeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKeyEvent: (KeyEvent event) {
          keyboardScrollEvent(event, _pageScrollController);
        },
        child: SingleChildScrollView(
          controller: _pageScrollController,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Constants.width * 0.1 - 40),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KDimension().kHeight40,
                Kstyles().semibold(
                  text: StringConst.myAccount,
                  color: AppColors.orange,
                  size: getValueForScreenType(
                    context: context,
                    mobile: 32,
                    desktop: 38,
                  ),
                ),
                KDimension().kHeight40,
                _ticketsAvailable(
                  sizeInformation: sizeInformation,
                  context: context,
                ),
                const SizedBox(
                  height: 80,
                ),
                if (sizeInformation.isMobile) const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _ticketsAvailable(
      {required SizingInformation sizeInformation,
      required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 93,
        left: 40,
        right: 40,
      ),
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Constants.width > 1430
                  ? Constants.width
                  : Constants.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _upcomingTicketsListBuilder(context, sizeInformation, state),
                  KDimension().kHeight40,
                  const Divider(
                    color: AppColors.darkGrey,
                    height: 2,
                  ),
                  KDimension().kHeight40,
                  _buildUserInformationView(sizeInformation: sizeInformation)
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Container _upcomingTicketsListBuilder(BuildContext context,
      SizingInformation sizeInformation, ProfileState state) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        right: 30,
        left: 30,
      ),
      color: AppColors.backgroundColor3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Kstyles().semibold(
            text: "My Bookings",
            color: AppColors.black,
            size: 20,
          ),
          KDimension().kHeight10,
          const DottedSeparator(
            dashGapLength: 2,
            dashLength: 2,
            color: AppColors.darkGrey,
          ),
          KDimension().kHeight25,
          if (state.ticketList.isNotEmpty)
            ...List.generate(state.ticketList.length, (index) {
              return
                  //  index == 0
                  //     ? const SizedBox()
                  //     :
                  _upcomingTicketItem(
                sizeInformation: sizeInformation,
                index: index,
                state: state,
              );
            }),
          if (state.ticketList.isEmpty) KDimension().kHeight80,
        ],
      ),
    );
  }

  //Upcoming ticket Item
  Widget _upcomingTicketItem(
      {required SizingInformation sizeInformation,
      required int index,
      required ProfileState state}) {
    // print(index);
    return sizeInformation.isDesktop
        ? Container(
            // color: AppColors.backgroundColor3,
            margin: const EdgeInsets.only(bottom: 30),
            // padding: const EdgeInsets.only(
            //   top: 10,
            //   bottom: 10,
            // ),
            child: SizedBox(
              width: Constants.width > 1430
                  ? Constants.width
                  : Constants.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        state.ticketList[index].bannerUrl ?? '',
                        height: 185,
                        fit: BoxFit.fill,
                      ),
                      // Stack(
                      //   children: [
                      //     Image.network(
                      //       state.ticketList[index].bannerUrl ?? '',
                      //       height: 185,
                      //       fit: BoxFit.fill,
                      //     ),
                      //     _ticketOverlayWidget(
                      //         state.ticketList[index].isTicketCancelled ==
                      //             StringConst.yesKey),
                      //   ],
                      // ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: Constants.width * 0.028,
                            right: Constants.width * 0.015,
                            // top: 10,
                            bottom: 10,
                          ),
                          child: _topRightTextSection(
                              state.ticketList[index].eventDescription ?? '',
                              state.ticketList[index].eventName ?? '',
                              state,
                              index,
                              sizeInformation),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Container(
            // color: AppColors.backgroundColor3,
            margin: const EdgeInsets.only(bottom: 30),
            // padding: const EdgeInsets.only(
            //   top: 20,
            //   bottom: 10,

            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  state.ticketList[index].bannerUrl ?? '',
                  width: getValueForScreenType(
                    context: context,
                    mobile: 540,
                    tablet: 400,
                  ),
                  fit: BoxFit.cover,
                ),
                // Stack(
                //   children: [
                //     Image.network(
                //       state.ticketList[index].bannerUrl ?? '',
                //       width: getValueForScreenType(
                //         context: context,
                //         mobile: 540,
                //         tablet: 400,
                //       ),
                //       fit: BoxFit.cover,
                //     ),
                //     _ticketOverlayWidget(
                //         state.ticketList[index].isTicketCancelled ==
                //             StringConst.yesKey)
                //   ],
                // ),
                Container(
                  padding: EdgeInsets.only(
                    right: getValueForScreenType(
                        context: context,
                        mobile: 0,
                        desktop: Constants.width * 0.04),
                    top: 10,
                    bottom: 10,
                    left: getValueForScreenType(
                        context: context, mobile: 0, desktop: 20),
                  ),
                  child: _topRightTextSection(
                      state.ticketList[index].eventDescription ?? '',
                      state.ticketList[index].eventName ?? '',
                      state,
                      index,
                      sizeInformation),
                ),
              ],
            ),
          );
  }

  Widget _ticketOverlayWidget(bool visibility) {
    return Visibility(
      visible: visibility,
      child: Positioned.fill(
        child: Container(
          color: AppColors.black.withOpacity(0.7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsConst.ticketColorIcon,
                width: 70,
              ),
              KDimension().kHeight15,
              Kstyles().semibold(
                text: StringConst.yourTicketsCanceled,
                size: 22,
                color: AppColors.orange,
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topRightTextSection(
    String description,
    String eventName,
    ProfileState state,
    int index,
    SizingInformation sizeInformation,
  ) {
    double labelWidth =
        (state.ticketList[index].numberOfPax ?? 0) >= 1 ? 90 : 60;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Kstyles().semibold(
          text: eventName,
          color: AppColors.black,
          size: getValueForScreenType(
            context: context,
            mobile: 24,
            desktop: 28,
          ),
        ),
        KDimension().kHeight10,
        if (!isEmpty(state.ticketList[index].nextEventDate))
          _ticketInfoItem(
            "Date",
            state.ticketList[index].nextEventDate ?? '',
            labelWidth,
          ),
        if (!isEmpty(state.ticketList[index].nextEventTime))
          _ticketInfoItem(
            "Time",
            state.ticketList[index].nextEventTime ?? '',
            labelWidth,
          ),
        if (!isEmpty(state.ticketList[index].nextEventVenue))
          _ticketInfoItem(
            "Venue",
            state.ticketList[index].nextEventVenue ?? '',
            labelWidth,
          ),
        if ((state.ticketList[index].numberOfPax ?? 0) >= 1)
          _ticketInfoItem(
            "Ticket(s)",
            "${state.ticketList[index].numberOfPax ?? 1}",
            labelWidth,
          ),
        KDimension().kHeight10,
        _viewMyTicketButton(state, index),
        KDimension().kHeight05,
      ],
    );
  }

  bool isEmpty(String? value) {
    String val = value ?? "";
    return val.isEmpty ? true : false;
  }

  //ticket info item
  Widget _ticketInfoItem(
    String label,
    String value,
    double labelWidth,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: labelWidth,
          child: Kstyles().reg(
            text: label,
            color: AppColors.black,
            size: getValueForScreenType(
              context: context,
              mobile: 14,
              desktop: 16,
            ),
          ),
        ),
        // KDimension().kWidth10,
        Kstyles().reg(
          text: ":",
          color: AppColors.black,
          size: getValueForScreenType(
            context: context,
            mobile: 14,
            desktop: 16,
          ),
        ),
        KDimension().kWidth15,
        Expanded(
          child: Kstyles().reg(
            text: value,
            color: AppColors.black,
            maxLines: 10,
            size: getValueForScreenType(
              context: context,
              mobile: 14,
              desktop: 16,
            ),
          ),
        ),
      ],
    );
  }

//
  Widget _viewMyTicketButton(ProfileState state, int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (kIsWeb) {
            html.window.open(
                "${html.window.location.origin}/myaccount${StringConst.ticketDetailsViewRoute}/${state.ticketList[index].ticketCode}",
                '_blank');
          } else {
            context.go(
                "${StringConst.ticketDetailsViewRoute}/${state.ticketList[index].ticketCode}");
          }
        },
        child: Row(
          children: [
            Kstyles().med(
              text: StringConst.viewTickets,
              color: AppColors.orange,
              decoration: TextDecoration.underline,
              size: getValueForScreenType(
                context: context,
                mobile: 14,
                desktop: 16,
              ),
            ),
            KDimension().kWidth10,
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Icon(
                Icons.visibility_outlined,
                color: AppColors.orange,
                size: getValueForScreenType(
                  context: context,
                  mobile: 15,
                  desktop: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //
  Widget _buildUserInformationView(
      {required SizingInformation sizeInformation}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.backgroundColor3, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0.1,
          blurRadius: 10,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ]),
      padding: EdgeInsets.symmetric(
        horizontal: Constants.width * 0.03,
        // vertical: 20,
      ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserInformationSection(
                state,
                _buildProfileWidget(
                  state,
                ),
                StringConst.myProfile,
                true,
                () {},
                false,
              ),
              KDimension().kHeight25,
              const DottedSeparator(
                dashGapLength: 2,
                dashLength: 2,
                color: AppColors.darkGrey,
              ),
              _buildUserInformationSection(
                state,
                _buildMyInterestSection(
                  state,
                ),
                "My Interests",
                false,
                () => context.read<ProfileBloc>().add(
                      const ToggleInformationEvent(true),
                    ),
                state.toggleInterest,
              ),
              _buildUserInformationSection(
                state,
                _buildMarketingConsentCheckboxWidget(state),
                "My Consent",
                false,
                () => context.read<ProfileBloc>().add(
                      const ToggleInformationEvent(false),
                    ),
                state.toggleConsent,
              ),
              KDimension().kHeight30,
            ],
          );
        },
      ),
    );
  }

  Widget _buildUserInformationSection(
    ProfileState state,
    Widget content,
    String title,
    bool isProfile,
    VoidCallback toggle,
    bool isOpen,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _informationTitleWidget(
          title,
          toggle,
          isProfile,
          isOpen,
        ),
        const DottedSeparator(
          dashGapLength: 2,
          dashLength: 2,
          color: AppColors.darkGrey,
        ),
        KDimension().kHeight05,
        if (isOpen && !isProfile) content,
        if (isProfile) content,
      ],
    );
  }

  Widget _informationTitleWidget(
    String title,
    VoidCallback onTap,
    bool isProfile,
    bool isOpen,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KDimension().kHeight15,
              Kstyles().bold(
                text: title,
                color: AppColors.black,
                size: getValueForScreenType(
                    context: context, mobile: 18, desktop: 20),
              ),
              KDimension().kHeight15,
            ],
          ),
        ),

        // KDimension().kWidth05,
        if (!isProfile)
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: onTap,
              child: SizedBox(
                width: 50,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    isOpen ? AssetsConst.upArrow : AssetsConst.downArrow,
                    height: 14,
                    width: 14,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMyInterestSection(ProfileState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KDimension().kHeight05,
        Kstyles().reg(
          text: "Choose all that apply.",
          color: AppColors.black,
          size: 16,
        ),
        KDimension().kHeight15,
        Wrap(
          runSpacing: 15,
          spacing: 15,
          runAlignment: WrapAlignment.start,
          children: [
            ...List.generate(
              state.profile.interests?.length ?? 0,
              (index) {
                return _interestChip(
                  () => context.read<ProfileBloc>().add(
                        UpdateMyInterestEvent(
                          context,
                          state.profile.interests![index].interestCode ?? "",
                          (state.profile.interests![index].isSelected ?? "") ==
                                  StringConst.yesKey
                              ? StringConst.noKey
                              : StringConst.yesKey,
                        ),
                      ),
                  state.profile.interests![index].interestName ?? "",
                  (state.profile.interests![index].isSelected ?? "") ==
                      StringConst.yesKey,
                );
              },
            ),
          ],
        ),

        KDimension().kHeight30,
        //
        Kstyles().reg(
          text: "Something else? Tell us your interests.",
          color: AppColors.black,
          size: 16,
        ),
        KDimension().kHeight10,
        SizedBox(
          height: 50,
          child: CustomWidgets.commonTextField(
            textEditingController: addMoreInterest,
            backgroundColor: AppColors.white,
            hintText: "",
            borderColor: AppColors.transparent,
            keyBoardType: TextInputType.text,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    context.read<ProfileBloc>().add(
                          AddMoreInterestEvent(
                            context,
                            addMoreInterest,
                          ),
                        );
                  },
                  child: const Icon(
                    Icons.add,
                    color: AppColors.orange,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        KDimension().kHeight15,
        Wrap(
          runSpacing: 15,
          spacing: 15,
          runAlignment: WrapAlignment.start,
          children: [
            ...List.generate(
              state.profile.moreInterests?.length ?? 0,
              (index) {
                return _moreInterestChip(
                  () {
                    context.read<ProfileBloc>().add(
                          DeleteMoreInterestEvent(
                            context,
                            state.profile.moreInterests![index]
                                    .moreInterestCode ??
                                "",
                          ),
                        );
                  },
                  state.profile.moreInterests![index].moreInterestName ?? "",
                );
              },
            ),
          ],
        ),
        KDimension().kHeight50,
        const DottedSeparator(
          dashGapLength: 2,
          dashLength: 2,
          color: AppColors.darkGrey,
        ),
      ],
    );
  }

  Widget _moreInterestChip(
    VoidCallback onTap,
    String name,
  ) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 15),
      decoration: const BoxDecoration(
        color: AppColors.orange,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.remove,
                  color: AppColors.white,
                  size: 28,
                ),
              ),
            ),
          ),
          KDimension().kWidth05,
          Kstyles().semibold(
            text: name,
            color: AppColors.white,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _interestChip(
    VoidCallback onTap,
    String name,
    bool isSelected,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.orange : AppColors.transparent,
            border: Border.all(
                color: isSelected ? AppColors.orange : AppColors.orange),
          ),
          child: Kstyles().semibold(
            text: name,
            color: isSelected ? AppColors.white : AppColors.orange,
            size: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildMarketingConsentCheckboxWidget(ProfileState state) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.read<ProfileBloc>().add(ProfileCheckboxMarketingConsentEvent(
              state.isCheckedMarketingConsent == false ? 1 : 0, context));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.only(top: 1),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.orange,
                  ),
                ),
                child: state.isCheckedMarketingConsent == true
                    ? const Center(
                        child: Icon(
                          Icons.check,
                          color: AppColors.orange,
                          size: 18,
                        ),
                      )
                    : Container(),
              ),
              KDimension().kWidth10,
              Expanded(
                child: Kstyles().reg(
                  text: StringConst.marketingConsentText,
                  maxLines: 15,
                  size: 12,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildProfileWidget(
    ProfileState state,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildProfileItem(
                value: state.profile.firstName ?? "",
                title: StringConst.firstName,
              ),
            ),
            KDimension().kWidth05,
            _editProfileBtn(
              state,
            ),
          ],
        ),
        _buildProfileItem(
          value: state.profile.lastName ?? "",
          title: StringConst.lastName,
        ),
        _buildProfileItem(
          value: state.profile.email ?? "",
          title: StringConst.email,
        ),
        _buildProfileItem(
          title: StringConst.joinedOn,
          value: (state.profile.joinedOn ?? "").formatAndConvertToDateString(),
        ),
        // _buildVerifiedWidget(state, "Verified on"),
      ],
    );
  }

  Widget _buildVerifiedWidget(
    ProfileState state,
    String label,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 125,
            child: Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Kstyles().reg(
                    text: "$label :",
                    color: AppColors.black,
                    size: getValueForScreenType(
                      context: context,
                      mobile: 14,
                      desktop: 16,
                    )),
              ],
            ),
          ),
          KDimension().kWidth05,
          (state.profile.isMyInfoVarified ?? "").contains('Profile is verified')
              ? const Icon(
                  Icons.verified,
                  color: AppColors.green,
                )
              : const Icon(
                  Icons.close_rounded,
                  color: AppColors.red,
                ),
          KDimension().kWidth10,
          Flexible(
            child: Kstyles().bold(
              text: state.profile.isMyInfoVarified ?? "",
              color: AppColors.black,
              maxLines: 4,
              size: getValueForScreenType(
                context: context,
                mobile: 16,
                desktop: 18,
              ),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }

  //edit profile button
  Widget _editProfileBtn(
    ProfileState state,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          firstName.text = state.profile.firstName ?? "";
          lastName.text = state.profile.lastName ?? "";
          email.text = state.profile.email ?? "";
          popUpEditProfile(
            nameController: firstName,
            lastNameController: lastName,
            emailController: email,
            context,
            "Edit Profile",
            saveName: () {
              context.read<ProfileBloc>().add(
                    EditProfileName(
                      firstName.text,
                      lastName.text,
                      context,
                    ),
                  );
            },
            saveEmail: () {
              context.read<ProfileBloc>().add(
                    EditProfileEmail(
                      email.text,
                      context,
                    ),
                  );
            },
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Kstyles().semibold(
              text: "Edit Profile",
              color: AppColors.orange,
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              size: 12,
            ),
            KDimension().kWidth05,
            const Icon(
              Icons.edit_outlined,
              color: AppColors.orange,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 125,
            child: Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Kstyles().reg(
                  text: "$title ",
                  color: AppColors.black,
                  size: 14,
                ),
                const Spacer(),
                Kstyles().reg(
                  text: ":",
                  color: AppColors.black,
                  size: 14,
                ),
              ],
            ),
          ),
          KDimension().kWidth05,
          Expanded(
            child: Kstyles().bold(
              text: value,
              maxLines: 4,
              size: getValueForScreenType(
                context: context,
                mobile: 14,
                desktop: 16,
              ),
              color: AppColors.black,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
