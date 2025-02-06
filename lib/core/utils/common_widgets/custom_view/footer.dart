import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/otp-verification-view/presentation/view/widgets/tc_alertbox.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      bool isDesktop = sizingInformation.isDesktop;
      return Container(
        color: AppColors.black,
        width: sizingInformation.screenSize.width,
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        height: isDesktop ? 60 : null,
        child: !isDesktop ? mobileTabletView(context) : desktopView(context),
      );
    });
  }

  Row desktopView(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Kstyles().med(
          size: 12,
          text: StringConst.copyrightText(DateTime.now().year.toString()),
          color: AppColors.white,
        ),
        const Spacer(),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return const TermAndConditionAlertBox();
                },
              );
            },
            child: Kstyles().med(
              size: 12,
              text: StringConst.termsAndConditionsFooter,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(width: 20),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () async {
              if (await launchUrl(
                Uri.parse(StringConst.contactUsUrl),
                webOnlyWindowName: '_blank',
              )) {
                throw Exception('Could not launch ${StringConst.contactUsUrl}');
              }
            },
            child: Kstyles().med(
              size: 12,
              text: StringConst.contactUs,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget mobileTabletView(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Kstyles().med(
            size: 12,
            text: StringConst.copyrightText(DateTime.now().year.toString()),
            color: AppColors.white,
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return const TermAndConditionAlertBox();
                },
              );
            },
            child: Kstyles().med(
              size: 12,
              text: StringConst.termsAndConditionsFooter,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              if (await launchUrl(
                Uri.parse(StringConst.contactUsUrl),
                webOnlyWindowName: '_blank',
              )) {
                throw Exception('Could not launch ${StringConst.contactUsUrl}');
              }
            },
            child: Kstyles().med(
              size: 12,
              text: StringConst.contactUs,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
