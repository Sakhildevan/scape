import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/asset_constants.dart';
import 'package:scape/core/utils/common_widgets/custom_view/animated_button.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/register/presentation/bloc/register_from_event_bloc.dart';
import 'package:scape/src/register/presentation/bloc/register_from_event_event.dart';
import 'package:scape/src/register/presentation/bloc/register_from_event_state.dart';
import 'package:scape/src/registration/presentation/bloc/registration_bloc.dart';

import '../../../../core/utils/common_widgets/custom_text.dart';

class FirstNameLastNameView extends StatefulWidget {
  const FirstNameLastNameView(
      {super.key,
      required this.firstNameEditingController,
      required this.lastNameEditingController,
      required this.emailEditingController});
  final TextEditingController firstNameEditingController;

  final TextEditingController lastNameEditingController;
  final TextEditingController emailEditingController;
  @override
  State<FirstNameLastNameView> createState() => _FirstNameLastNameViewState();
}

class _FirstNameLastNameViewState extends State<FirstNameLastNameView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveBuilder(
              builder: (
                BuildContext context,
                SizingInformation sizingInformation,
              ) =>
                  Container(
                margin: EdgeInsets.symmetric(
                    horizontal:
                        sizingInformation.isMobile || sizingInformation.isTablet
                            ? 25
                            : 0),
                padding: EdgeInsets.symmetric(
                  vertical: sizingInformation.isDesktop ? 30 : 20.0,
                  horizontal: sizingInformation.isDesktop ? 40 : 20.0,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.backgroundColor3,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    // Kstyles().bold16(
                    //     text: StringConst.firstName, color: AppColors.darkGrey),
                    // KDimension().kHeight10,
                    CustomWidgets.commonTextField(
                      textEditingController: widget.firstNameEditingController,
                      backgroundColor: AppColors.white,
                      hintText: StringConst.firstName,
                      hintTextStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: AppColors.grey,
                      ),
                      borderColor: AppColors.transparent,
                    ),
                    // KDimension().kHeight10,
                    // Kstyles().bold16(
                    //     text: StringConst.lastName, color: AppColors.darkGrey),
                    KDimension().kHeight15,
                    CustomWidgets.commonTextField(
                      textEditingController: widget.lastNameEditingController,
                      backgroundColor: AppColors.white,
                      hintText: StringConst.lastName,
                      hintTextStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: AppColors.grey,
                      ),
                      borderColor: AppColors.transparent,
                    ),
                    KDimension().kHeight15,
                    CustomWidgets.commonTextField(
                      textEditingController: widget.emailEditingController,
                      backgroundColor: AppColors.white,
                      hintText: StringConst.enterYourEmail,
                      readOnly: true,
                      hintTextStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: AppColors.black),
                      borderColor: AppColors.transparent,
                    ),
                    KDimension().kHeight20,
                    BlocBuilder<RegisterFromEventBloc, RegisterFromEventState>(
                      builder: (context, state) {
                        return _questionSection(state);
                      },
                    ),
                    KDimension().kHeight35,
                    _mcCheckbox(),
                    KDimension().kHeight15,
                    _tcCheckboxSection(),
                    KDimension().kHeight50,
                    _previousNextBtn(context, sizingInformation),
                    KDimension().kHeight10,
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  //Question section
  Widget _questionSection(RegisterFromEventState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Kstyles().semibold(
          text: StringConst.questionTitle,
          maxLines: 4,
          color: AppColors.black,
          size: getValueForScreenType(
            context: context,
            mobile: 16,
            tablet: 16,
            desktop: 18,
          ),
        ),
        KDimension().kHeight20,
        Kstyles().reg(
          text: StringConst.question1,
          maxLines: 3,
          color: AppColors.black,
          size: 14,
        ),
        KDimension().kHeight20,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _emojiItem(
              state,
              AssetsConst.emoji1,
              StringConst.emojiText1,
              () => context
                  .read<RegisterFromEventBloc>()
                  .add(const SetQuestionAnswer(questionNo: 1, item: 1)),
              1,
              1,
            ),
            _emojiItem(
              state,
              AssetsConst.emoji2,
              StringConst.emojiText2,
              () => context
                  .read<RegisterFromEventBloc>()
                  .add(const SetQuestionAnswer(questionNo: 1, item: 2)),
              1,
              2,
            ),
            _emojiItem(
              state,
              AssetsConst.emoji3,
              StringConst.emojiText3,
              () => context
                  .read<RegisterFromEventBloc>()
                  .add(const SetQuestionAnswer(questionNo: 1, item: 3)),
              1,
              3,
            ),
            _emojiItem(
              state,
              AssetsConst.emoji4,
              StringConst.emojiText4,
              () => context
                  .read<RegisterFromEventBloc>()
                  .add(const SetQuestionAnswer(questionNo: 1, item: 4)),
              1,
              4,
            ),
            _emojiItem(
              state,
              AssetsConst.emoji5,
              StringConst.emojiText5,
              () => context
                  .read<RegisterFromEventBloc>()
                  .add(const SetQuestionAnswer(questionNo: 1, item: 5)),
              1,
              5,
            ),
          ],
        ),
        KDimension().kHeight20,
        Kstyles().reg(
          text: StringConst.question2,
          maxLines: 3,
          color: AppColors.black,
          size: 14,
        ),
        KDimension().kHeight20,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _emojiItem(
              state,
              AssetsConst.emoji1,
              StringConst.emojiText1,
              () => context
                  .read<RegisterFromEventBloc>()
                  .add(const SetQuestionAnswer(questionNo: 2, item: 1)),
              2,
              1,
            ),
            _emojiItem(
              state,
              AssetsConst.emoji2,
              StringConst.emojiText2,
              () => context
                  .read<RegisterFromEventBloc>()
                  .add(const SetQuestionAnswer(questionNo: 2, item: 2)),
              2,
              2,
            ),
            _emojiItem(
              state,
              AssetsConst.emoji3,
              StringConst.emojiText3,
              () => context
                  .read<RegisterFromEventBloc>()
                  .add(const SetQuestionAnswer(questionNo: 2, item: 3)),
              2,
              3,
            ),
            _emojiItem(
              state,
              AssetsConst.emoji4,
              StringConst.emojiText4,
              () => context
                  .read<RegisterFromEventBloc>()
                  .add(const SetQuestionAnswer(questionNo: 2, item: 4)),
              2,
              4,
            ),
            _emojiItem(
              state,
              AssetsConst.emoji5,
              StringConst.emojiText5,
              () => context
                  .read<RegisterFromEventBloc>()
                  .add(const SetQuestionAnswer(questionNo: 2, item: 5)),
              2,
              5,
            ),
          ],
        ),
      ],
    );
  }

  Widget _emojiItem(
    RegisterFromEventState state,
    String emoji,
    String name,
    VoidCallback onTap,
    int questionNo,
    int itemNo,
  ) {
    bool isSelected = false;
    if (questionNo == 1) {
      isSelected = state.question1AnswerNo == itemNo;
    } else if (questionNo == 2) {
      isSelected = state.question2AnswerNo == itemNo;
    }
    return Expanded(
      flex: 1,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            color: isSelected
                ? AppColors.grey.withOpacity(0.2)
                : AppColors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  emoji,
                  fit: BoxFit.contain,
                ),
                KDimension().kHeight05,
                Kstyles().reg(
                  text: name,
                  maxLines: 3,
                  color: AppColors.black,
                  textAlign: TextAlign.center,
                  size: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Build agree checkbox section
  Widget _tcCheckboxSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _tcCheckbox(),
        KDimension().kWidth10,
        Expanded(child: _agreeRichText()),
      ],
    );
  }

  //Build marketing consent section
  Widget _mcCheckbox() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              context.read<RegistrationBloc>().add(
                  CheckboxChangeMarketingConsentEvent(
                      !state.isCheckedMarketingConsent));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.orange,
                    ),
                  ),
                  child: state.isCheckedMarketingConsent
                      ? const Center(
                          child: Icon(
                            Icons.check,
                            color: AppColors.orange,
                            size: 15,
                          ),
                        )
                      : Container(),
                ),
                KDimension().kWidth10,
                Expanded(
                  child: Kstyles().med(
                    text: StringConst.marketingConsentText,
                    maxLines: 20,
                    size: 10,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

//Checkbox
  Widget _tcCheckbox() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context
                .read<RegistrationBloc>()
                .add(CheckboxChangeTCEvent(!state.isCheckedTc));
          },
          child: Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppColors.orange,
              ),
            ),
            child: state.isCheckedTc
                ? const Center(
                    child: Icon(
                      Icons.check,
                      color: AppColors.orange,
                      size: 15,
                    ),
                  )
                : Container(),
          ),
        );
      },
    );
  }

//Build agree Rich text
  Widget _agreeRichText() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context
                .read<RegistrationBloc>()
                .add(CheckboxChangeTCEvent(!state.isCheckedTc));
          },
          child: Kstyles().med(
            text: StringConst.tcText,
            maxLines: 8,
            size: 10,
            color: AppColors.black,
          ),
        );
      }),
    );
  }

  Widget _previousNextBtn(
      BuildContext context, SizingInformation sizingInformation) {
    // final isMobile = sizingInformation.isMobile;

    Widget buttonsContent =
        // isMobile
        // ? Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: _buildButtons(context, sizingInformation),
        //   )
        // :
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _buildButtons(context, sizingInformation),
    );

    return SizedBox(
      width: double.infinity,
      child: Center(
        child: buttonsContent,
      ),
    );
  }

  List<Widget> _buildButtons(
      BuildContext context, SizingInformation sizingInformation) {
    return [
      AnimatedTextButton(
        fixedWidth: sizingInformation.isMobile ? 110 : 180,
        text: "Previous".toUpperCase(),
        showSuffixWidget: true,
        onPressed: () {
          context.read<RegistrationBloc>().add(
                CancelClicked(),
              );
        },
        smallDevice: sizingInformation.screenSize.width > 1000 ? false : true,
      ),
      if (sizingInformation.isMobile)
        KDimension().kHeight15, // Vertical spacing for mobile
      BlocBuilder<RegisterFromEventBloc, RegisterFromEventState>(
        builder: (context, state) {
          return AnimatedTextButton(
            fixedWidth: sizingInformation.isMobile ? 110 : 180,
            text: "Sign up".toUpperCase(),
            showPrefixWidget: true,
            onPressed: () {
              context.read<RegistrationBloc>().add(
                    RegistrationValidationEvent(
                      firstName: widget.firstNameEditingController.text,
                      lastName: widget.lastNameEditingController.text,
                      buildContext: context,
                      question1AnswerNo: state.question1AnswerNo,
                      question2AnswerNo: state.question2AnswerNo,
                    ),
                  );
            },
            smallDevice:
                sizingInformation.screenSize.width > 1000 ? false : true,
          );
        },
      ),
    ];
  }
}
