import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/asset_constants.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/promo_code/presentation/bloc/promo_code_bloc.dart';

class InvalidPromoCodeAlertBox extends StatelessWidget {
  const InvalidPromoCodeAlertBox({super.key, required this.promoCode});
  final String promoCode;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        scrollable: true,
        contentPadding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        backgroundColor: AppColors.white,
        content: Container(
          height: getValueForScreenType(
            context: context,
            mobile: 240,
            tablet: 235,
            desktop: 300,
          ),
          width: getValueForScreenType(
            context: context,
            mobile: 250,
            tablet: 350,
            desktop: 450,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: getValueForScreenType(
              context: context,
              mobile: 20,
              tablet: 30,
              desktop: 50,
            ),
            vertical: getValueForScreenType(
              context: context,
              mobile: 20,
              tablet: 20,
              desktop: 30,
            ),
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AssetsConst.addParticipantBackground,
                ),
                fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Image.asset(
                  AssetsConst.error,
                  height: getValueForScreenType(
                    context: context,
                    mobile: 35,
                    tablet: 40,
                    desktop: 50,
                  ),
                  width: getValueForScreenType(
                    context: context,
                    mobile: 35,
                    tablet: 40,
                    desktop: 50,
                  ),
                ),
              ),
              Kstyles().semibold(
                text: StringConst.oops,
                size: getValueForScreenType(
                  context: context,
                  mobile: 25,
                  desktop: 40,
                ),
                color: const Color(0xffF37321),
              ),
              KDimension().kHeight15,
              Kstyles().semibold(
                text: StringConst.promoCodeIsNotValid,
                textAlign: TextAlign.center,
                size: getValueForScreenType(
                  context: context,
                  mobile: 15,
                  desktop: 16,
                ),
                color: const Color(0xffBABABA),
              ),
              KDimension().kHeight20,
              GestureDetector(
                onTap: () {
                  context.pop();
                  context.read<PromoCodeBloc>().add(
                        PromoCodeNext(promoCode, context),
                      );
                },
                child: Container(
                  height: 50,
                  width: getValueForScreenType(
                    context: context,
                    mobile: Constants.width * 0.35,
                    tablet: Constants.width * 0.35,
                    desktop: 200,
                  ),
                  color: AppColors.orange,
                  child: Center(
                    child: Kstyles().bold15(
                      text: StringConst.tryAgain,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
