import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/font_constants.dart';

class Kstyles {
  //!------------------(poppins light)

  Text light12(
      {required String text,
      Color color = AppColors.black,
      double? height,
      TextOverflow overflow = TextOverflow.visible}) {
    return Text(
      overflow: overflow,
      text,
      style: GoogleFonts.openSans(
        height: height,
        fontSize: 12,
        color: color,
        fontWeight: FontConst().lightFont,
      ),
    );
  }

//!---------------------(poppins regular)
  Text reg12(
      {required String text,
      Color color = AppColors.black,
      double? height,
      TextOverflow overflow = TextOverflow.visible}) {
    return Text(
      overflow: overflow,
      text,
      style: GoogleFonts.openSans(
          height: height,
          fontSize: 12,
          color: color,
          fontWeight: FontConst().regularFont),
    );
  }

  Text reg({
    required String text,
    Color color = AppColors.black,
    double? height,
    bool? softWrap,
    double? size,
    FontStyle? fontStyle,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    TextAlign textAlign = TextAlign.start,
  }) {
    return Text(
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      text,
      maxLines: maxLines,
      style: GoogleFonts.openSans(
          height: height,
          fontSize: size,
          color: color,
          fontStyle: fontStyle,
          fontWeight: FontConst().regularFont),
    );
  }

  Text reg14(
      {required String text,
      Color color = AppColors.black,
      double? height,
      TextOverflow overflow = TextOverflow.visible}) {
    return Text(
      overflow: overflow,
      text,
      style: GoogleFonts.openSans(
          height: height,
          fontSize: 14,
          color: color,
          fontWeight: FontConst().regularFont),
    );
  }

  Text reg15(
      {required String text,
      Color color = AppColors.black,
      double? height,
      TextOverflow overflow = TextOverflow.visible}) {
    return Text(
      overflow: overflow,
      text,
      style: GoogleFonts.openSans(
          height: height,
          fontSize: 15,
          color: color,
          fontWeight: FontConst().regularFont),
    );
  }

//!---------------------(poppins medium)
  Text med12(
      {required String text,
      Color color = AppColors.black,
      TextAlign? textAlign,
      double? height,
      TextOverflow overflow = TextOverflow.visible}) {
    return Text(
      overflow: overflow,
      textAlign: textAlign,
      text,
      style: GoogleFonts.openSans(
          height: height,
          fontSize: 12,
          color: color,
          fontWeight: FontConst().mediumFont),
    );
  }

//!---------------------(poppins medium)
  Text med14(
      {required String text,
      Color color = AppColors.black,
      double? height,
      TextOverflow overflow = TextOverflow.visible}) {
    return Text(
      overflow: overflow,
      text,
      style: GoogleFonts.openSans(
          height: height,
          fontSize: 14,
          color: color,
          fontWeight: FontConst().mediumFont),
    );
  }

  Text med15(
      {required String text,
      Color color = AppColors.black,
      double? height,
      TextAlign? textAlign,
      TextOverflow overflow = TextOverflow.visible}) {
    return Text(
      overflow: overflow,
      text,
      textAlign: textAlign,
      style: GoogleFonts.openSans(
          height: height,
          fontSize: 15,
          color: color,
          fontWeight: FontConst().mediumFont),
    );
  }

  Text med(
      {required String text,
      Color color = AppColors.black,
      double? height,
      double? size,
      bool? softWrap,
      TextAlign? textAlign,
      FontStyle? fontStyle,
      int? maxLines,
      TextDecoration? decoration,
      TextOverflow overflow = TextOverflow.visible}) {
    return Text(
      maxLines: maxLines,
      overflow: overflow,
      text,
      softWrap: softWrap,
      textAlign: textAlign,
      style: GoogleFonts.openSans(
          decoration: decoration,
          decorationColor: AppColors.orange,
          decorationThickness: 3,
          height: height,
          fontSize: size,
          color: color,
          fontStyle: fontStyle,
          fontWeight: FontConst().mediumFont),
    );
  }

//!---------------------(poppins semiBold)
  Text semiBold12(
      {required String text,
      Color color = AppColors.black,
      double? height,
      TextOverflow overflow = TextOverflow.visible}) {
    return Text(
      overflow: overflow,
      text,
      style: GoogleFonts.oswald(
          height: height,
          fontSize: 12,
          color: color,
          fontWeight: FontConst().semiBoldFont),
    );
  }

  Text semiBold14({
    required String text,
    Color color = AppColors.black,
    double? height,
    TextOverflow overflow = TextOverflow.visible,
    int? maxLines,
  }) {
    return Text(
      overflow: overflow,
      text,
      maxLines: maxLines,
      style: GoogleFonts.oswald(
          height: height,
          fontSize: 14,
          color: color,
          fontWeight: FontConst().semiBoldFont),
    );
  }

  Text semibold({
    required String text,
    Color color = AppColors.black,
    double? height,
    double? size,
    bool? softWrap,
    TextOverflow overflow = TextOverflow.visible,
    TextAlign? textAlign,
    int? maxLines,
    TextDecoration? decoration,
    double? decorationThickness,
  }) {
    return Text(
      softWrap: softWrap,
      overflow: overflow,
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: GoogleFonts.oswald(
          decoration: decoration,
          decorationColor: AppColors.orange,
          decorationThickness: decorationThickness ?? 3,
          height: height,
          fontSize: size,
          color: color,
          fontWeight: FontConst().semiBoldFont),
    );
  }

//!---------------------(poppins Bold)
  Text bold12(
      {required String text,
      Color color = AppColors.black,
      double? height,
      TextOverflow overflow = TextOverflow.visible}) {
    return Text(
      overflow: overflow,
      text,
      style: GoogleFonts.oswald(
          height: height,
          fontSize: 12,
          color: color,
          fontWeight: FontConst().boldFont),
    );
  }

  Text bold(
      {required String text,
      Color color = AppColors.black,
      double? height,
      double? size,
      bool? softWrap,
      int? maxLines,
      TextAlign? textAlign,
      TextOverflow overflow = TextOverflow.ellipsis}) {
    return Text(
      softWrap: softWrap,
      overflow: overflow,
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: GoogleFonts.oswald(
          height: height,
          fontSize: size,
          color: color,
          fontWeight: FontConst().boldFont),
    );
  }

  Text bold14(
      {required String text,
      Color color = AppColors.black,
      double? height,
      TextAlign? textAlign,
      TextOverflow overflow = TextOverflow.visible}) {
    return Text(
      textAlign: textAlign,
      overflow: overflow,
      text,
      style: GoogleFonts.oswald(
          height: height,
          fontSize: 14,
          color: color,
          fontWeight: FontConst().boldFont),
    );
  }

  Text bold15(
      {required String text,
      Color color = AppColors.black,
      double? height,
      TextAlign? textAlign,
      TextOverflow overflow = TextOverflow.visible}) {
    return Text(
      textAlign: textAlign,
      overflow: overflow,
      text,
      style: GoogleFonts.oswald(
          height: height,
          fontSize: 15,
          color: color,
          fontWeight: FontConst().boldFont),
    );
  }

  Text bold16(
      {required String text,
      Color color = AppColors.black,
      double? height,
      TextOverflow overflow = TextOverflow.visible}) {
    return Text(
      overflow: overflow,
      text,
      style: GoogleFonts.oswald(
          height: height,
          fontSize: 16,
          color: color,
          fontWeight: FontConst().boldFont),
    );
  }
}
