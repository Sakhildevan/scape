import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_widgets/custom_view/next_btn.dart';
import 'package:scape/core/utils/common_widgets/custom_view/previous_btn.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/src/retrieve-myinfo-view/presentation/view/widgets/retrieve_myinfo_button.dart';

class BottomButtonSection extends StatefulWidget {
  const BottomButtonSection({
    super.key,
    required this.pageIndex,
    this.emailController,
  });
  final int pageIndex;
  final TextEditingController? emailController;

  @override
  State<BottomButtonSection> createState() => _BottomButtonSectionState();
}

class _BottomButtonSectionState extends State<BottomButtonSection> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        color: AppColors.white,
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.1),
        child: widget.pageIndex == 2
            ? Align(
                alignment: Alignment.centerRight,
                child: RetrieveButton(
                  sizingInformation: sizingInformation,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (widget.pageIndex != 0 && widget.pageIndex != 3)
                    PreviousButton(
                      index: widget.pageIndex,
                      sizingInformation: sizingInformation,
                    ),
                  const Spacer(),
                  widget.pageIndex == 0
                      ? NextButton(
                          index: widget.pageIndex,
                          emailController: widget.emailController,
                          sizingInformation: sizingInformation,
                        )
                      : NextButton(
                          index: widget.pageIndex,
                          sizingInformation: sizingInformation,
                        ),
                ],
              ),
      ),
    );
  }
}
