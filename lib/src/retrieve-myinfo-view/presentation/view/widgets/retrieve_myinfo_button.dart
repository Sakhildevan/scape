import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/retrieve-myinfo-view/bloc/retrieve_info_bloc.dart';
import 'package:scape/src/retrieve-myinfo-view/bloc/retrieve_info_event.dart';

import '../../../../../core/utils/asset_constants.dart';

class RetrieveButton extends StatelessWidget {
  const RetrieveButton({super.key, required this.sizingInformation});
  final SizingInformation sizingInformation;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
              horizontal: sizingInformation.isMobile ? 20 : 30,
              vertical: sizingInformation.isMobile ? 10 : 20),
        ),
        backgroundColor: const WidgetStatePropertyAll(AppColors.mediumRed),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide.none,
          ),
        ),
      ),
      onPressed: () {
        //!---Below line of code only used For navigating
        // to the next page. Will replace later with redirect url ------!//
        context.read<RetrieveInfoBloc>().add(const GetSingPassRedirectUrl());
        // context.go(StringConst.ticketBookingViewRoute);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Kstyles().med(
                text: StringConst.retrieveMyInfoWith,
                size: 14,
                color: AppColors.white,
              ),
            ),
            KDimension().kWidth05,
            Image.asset(
              AssetsConst.singPassImage,
              scale: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}
