import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/font_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class EnquiresView extends StatelessWidget {
  const EnquiresView({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: StringConst.enquiresText,
            style: GoogleFonts.openSans(
                fontSize: 14,
                color: AppColors.black,
                fontWeight: FontConst().mediumFont),
          ),
          WidgetSpan(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: StringConst.enquiresEmail,
                  );
                  if (await canLaunchUrl(emailUri)) {
                    await launchUrl(emailUri);
                  } else {
                    // Handle the error if the email app or browser cannot be launched
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Unable to open mail app")),
                    );
                  }
                },
                child: Text(
                  StringConst.enquiresEmail,
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontConst().mediumFont,
                    color: AppColors.orange,
                    decoration: TextDecoration.underline, // Underline the text
                    decorationColor: AppColors.orange,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
