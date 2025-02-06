import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scape/core/utils/asset_constants.dart';
import 'package:scape/core/utils/common_widgets/logout_button.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'dart:html' as html;

import 'package:url_launcher/url_launcher.dart';

class AppBarLogo extends StatelessWidget {
  final bool isFromProfile;
  final bool showLogout;
  const AppBarLogo(
      {super.key, required this.isFromProfile, required this.showLogout});
  Future<void> _launchURL() async {
    if (kIsWeb) {
      html.window.open(StringConst.scapeMainSiteURL, '_blank');
    } else {
      final Uri url = Uri.parse(StringConst.scapeMainSiteURL);
      try {
        if (await canLaunchUrl(url)) {
          await launchUrl(
            url,
            mode: LaunchMode.externalApplication,
          );
        } else {
          throw 'Could not launch $url';
        }
      } catch (e) {
        debugPrint('Error launching URL: $e');
        //   // You might want to show a snackbar or dialog here to inform the user
        //  customErrorSnackBar(context, message: "Could not open the website");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.width * 0.1,
          vertical: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: _launchURL,
                child: Image.asset(
                  AssetsConst.logo,
                  height: 40,
                ),
              ),
            ),
            if (showLogout) logoutButton(context, isFromProfile: isFromProfile)
          ],
        ),
      ),
    );
  }
}
