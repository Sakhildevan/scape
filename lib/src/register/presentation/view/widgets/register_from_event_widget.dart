import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/asset_constants.dart';
import 'package:scape/core/utils/common_widgets/custom_text.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/register/presentation/bloc/register_from_event_bloc.dart';
import 'package:scape/src/register/presentation/bloc/register_from_event_event.dart';
import 'package:scape/src/register/presentation/bloc/register_from_event_state.dart';

class RegistrationFromEventWidget extends StatefulWidget {
  final bool isExpandedNeeds;
  final String email;
  const RegistrationFromEventWidget(
      {super.key, this.isExpandedNeeds = false, required this.email});

  @override
  State<RegistrationFromEventWidget> createState() =>
      _RegistrationFromEventWidgetState();
}

class _RegistrationFromEventWidgetState
    extends State<RegistrationFromEventWidget> {
  final TextEditingController _firstNameEditingController =
      TextEditingController();
  final TextEditingController _lastNameEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return widget.isExpandedNeeds
        ? Expanded(flex: 1, child: _buildContent())
        : _buildContent();
  }

  Widget _buildContent() {
    return BlocBuilder<RegisterFromEventBloc, RegisterFromEventState>(
      builder: (context, state) {
        if (_firstNameEditingController.text.isEmpty) {
          _firstNameEditingController.text = state.firstName;
        }
        if (_lastNameEditingController.text.isEmpty) {
          _lastNameEditingController.text = state.lastName;
        }
        if (_emailEditingController.text.isEmpty) {
          _emailEditingController.text = state.email;
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kstyles().med(
            //   text: StringConst.firstName,
            //   color: AppColors.black,
            //   size: getValueForScreenType(
            //     context: context,
            //     mobile: 16,
            //     desktop: 18,
            //   ),
            // ),
            // KDimension().kHeight05,
            CustomWidgets.commonTextField(
              textEditingController: _firstNameEditingController,
              backgroundColor: AppColors.white,
              hintText: StringConst.firstName,
              hintTextStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.grey,
              ),
              borderColor: AppColors.transparent,
              onChanged: (value) {
                context
                    .read<RegisterFromEventBloc>()
                    .add(RegisterFromEventValidationEvent(
                      // email: widget.email,
                      firstName: value,
                      lastName: _lastNameEditingController.text,
                      buildContext: context,
                    ));
              },
            ),
            KDimension().kHeight15,
            // Kstyles().med(
            //   text: StringConst.lastName,
            //   color: AppColors.black,
            //   maxLines: 4,
            //   size: getValueForScreenType(
            //     context: context,
            //     mobile: 16,
            //     desktop: 18,
            //   ),
            // ),
            // KDimension().kHeight05,
            CustomWidgets.commonTextField(
              textEditingController: _lastNameEditingController,
              backgroundColor: AppColors.white,
              hintText: StringConst.lastName,
              hintTextStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.grey,
              ),
              borderColor: AppColors.transparent,
              onChanged: (value) {
                context
                    .read<RegisterFromEventBloc>()
                    .add(RegisterFromEventValidationEvent(
                      // email: widget.email,
                      firstName: _firstNameEditingController.text,
                      lastName: value,
                      buildContext: context,
                    ));
              },
            ),
            KDimension().kHeight15,
            // Kstyles().med(
            //   text: StringConst.email,
            //   color: AppColors.black,
            //   maxLines: 4,
            //   size: getValueForScreenType(
            //     context: context,
            //     mobile: 16,
            //     desktop: 18,
            //   ),
            // ),
            // KDimension().kHeight05,
            CustomWidgets.commonTextField(
              textEditingController: _emailEditingController,
              backgroundColor: AppColors.white,
              hintText: StringConst.enterYourEmail,
              readOnly: true,
              hintTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black),
              borderColor: AppColors.transparent,
              onChanged: (value) {},
            ),
            KDimension().kHeight20,
            _questionSection(state),
            KDimension().kHeight35,
            _mcCheckbox(),
            KDimension().kHeight15,
            _checkboxSection(),
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

  //Build marketing consent section
  Widget _mcCheckbox() {
    return BlocBuilder<RegisterFromEventBloc, RegisterFromEventState>(
      builder: (context, state) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              context.read<RegisterFromEventBloc>().add(
                  RegisterFromEventCheckboxMarketingConsentEvent(
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
  Widget _checkbox() {
    return BlocBuilder<RegisterFromEventBloc, RegisterFromEventState>(
      builder: (context, state) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              // if (!state.isChecked) {
              //   context
              //       .read<RegisterFromEventBloc>()
              //       .add(OtpRegistrationValidationEvent(
              //         email: widget.email,
              //         firstName: _firstNameEditingController.text,
              //         lastName: _lastNameEditingController.text,
              //         buildContext: context,
              //       ));
              // } else {
              context
                  .read<RegisterFromEventBloc>()
                  .add(CheckboxChangeEvent(!state.isChecked));
              // }
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
              child: state.isChecked
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        color: AppColors.orange,
                        size: 15,
                      ),
                    )
                  : Container(),
            ),
          ),
        );
      },
    );
  }

  //Build agree checkbox section
  Widget _checkboxSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _checkbox(),
        KDimension().kWidth10,
        Expanded(child: _agreeRichText()),
      ],
    );
  }

  //Build agree Rich text
  Widget _agreeRichText() {
    return BlocBuilder<RegisterFromEventBloc, RegisterFromEventState>(
        builder: (context, state) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            context
                .read<RegisterFromEventBloc>()
                .add(CheckboxChangeEvent(!state.isChecked));
            // }
          },
          child: Kstyles().med(
            text: StringConst.tcText,
            maxLines: 8,
            size: 10,
            color: AppColors.black,
          ),
        ),
      );
    });
  }
}
