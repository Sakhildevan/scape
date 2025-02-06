import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/asset_constants.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/popup_loading.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/text_styles.dart';

Widget logoutButton(BuildContext context, {required bool isFromProfile}) {
  return Align(
    alignment: Alignment.topRight,
    child: PopupMenuButton<String>(
      position: PopupMenuPosition.under,
      offset: const Offset(2, 21),
      menuPadding: const EdgeInsets.all(8),
      color: AppColors.black.withOpacity(0.7),
      onSelected: (value) async {
        if (value == StringConst.myAccount) {
          context.go(StringConst.profileViewRoute);
        } else {
          popupLoading(context);
          var eventCode = await GetStorage().read(StringConst.eventKey);

          await GetStorage().erase().then((_) async {
            if (context.mounted) {
              context.pop();
              if (isFromProfile) {
                context.go(StringConst.registrationViewRoute);
              } else {
                context
                    .replace("${StringConst.startBookingViewRoute}/$eventCode");
              }
            }
          }).onError((e, s) {
            context.pop();
            logger.e(e.toString());
          });
        }
      },
      itemBuilder: (ctx) {
        return [
          PopupMenuItem(
            value: StringConst.myAccount,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Kstyles().semibold(
                    text: StringConst.myAccount.toUpperCase(),
                    color: AppColors.white,
                    size: getValueForScreenType(
                      context: context,
                      mobile: 14,
                      desktop: 16,
                    )),
              ),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            value: StringConst.logout,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Kstyles().semibold(
                    text: StringConst.logout.toUpperCase(),
                    color: AppColors.white,
                    size: getValueForScreenType(
                      context: context,
                      mobile: 14,
                      desktop: 16,
                    )),
              ),
            ),
          ),
        ];
      },
      child: Image.asset(
        AssetsConst.user,
        height: 30,
        width: 30,
        fit: BoxFit.contain,
      ),
    ),
  );
}
