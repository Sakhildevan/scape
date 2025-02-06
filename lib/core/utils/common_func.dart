import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:scape/core/utils/asset_constants.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scape/core/utils/common_widgets/custom_snackbar.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/ticket_details/presentation/custom-pdf-generation/custom_export_delegate.dart';

// // Function to set a cookie
// void setCookie(String key, String value) {
//   // Set cookie with 30 days expiration
//   final expiration = DateTime.now().add(Duration(days: 60));
//   final cookie = '$key=$value; expires=${expiration.toUtc()}; path=/';
//   html.document.cookie = cookie;
// }

// // Function to get a cookie value
// String? getCookie(String key) {
//   String? cookies = html.document.cookie;
//   if (cookies != null && cookies.isNotEmpty) {
//     List<String> listValues = cookies.split(';');
//     String? matchVal;

//     for (var value in listValues) {
//       List<String> map = value.split('=');
//       String _key = map[0].trim();

//       if (_key == key) {
//         matchVal = map[1];
//         break;
//       }
//     }
//     return matchVal;
//   }
//   return null;
// }

// // Function to remove a cookie
// void removeCookie(String key) {
//   // Set cookie with past expiration date to remove it
//   html.document.cookie = '$key=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/';
// }

bool didExceedTextMaxLines(String text, double width) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: const TextStyle(fontSize: 16)),
    maxLines: 5,
    textDirection: TextDirection.ltr,
  )..layout(maxWidth: width);

  return textPainter.didExceedMaxLines;
}

//Keyboard scroll
void keyboardScrollEvent(KeyEvent event, ScrollController scrollController) {
  if (event is KeyDownEvent) {
    final offset = scrollController.offset;

    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      scrollController.animateTo(
        offset + 70,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      scrollController.animateTo(
        offset - 70,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }
}

Future<void> savePdfFile(Uint8List pdfBytes, String name,
    SizingInformation sizingInformation) async {
  if (kIsWeb) {
    // Web platform
    final blob = html.Blob([pdfBytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    // final anchor =
    html.AnchorElement(href: url)
      ..setAttribute("download", name)
      ..click();

    // Clean up
    html.Url.revokeObjectUrl(url);
  } else {
    // Mobile or desktop platforms
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File('${dir.path}/$name');
    await file.writeAsBytes(pdfBytes);
    debugPrint('Saved exported PDF at: ${file.path}');
  }
}

Future<void> generatePdf(
  BuildContext context,
  CustomExportDelegate exportDelegate,
  SizingInformation sizingInformation,
  String eventName,
) async {
  try {
    // Ensure the widget tree is fully rendered
    await Future.delayed(const Duration(milliseconds: 100));

    // const ExportOptions overrideOptions = ExportOptions(
    //   pageFormatOptions: PageFormatOptions.a4(),
    // );

    // Capture multiple images
    List<Uint8List> pageImages = await exportDelegate.captureImages(
      StringConst.captureFrameId,
      sizingInformation,
      maxHeight: 842, // A4 height in points
    );
    if (pageImages.isNotEmpty) {
      final font = await PdfGoogleFonts.oswaldBold();
      final logo = await rootBundle.load(AssetsConst.logo);
      final logoImageBytes = logo.buffer.asUint8List();
      // Create an image from the asset bytes
      final logoImage = pw.MemoryImage(logoImageBytes);
      // Create a PDF document
      final pdf = pw.Document();

      // Add each image as a separate page
      for (int i = 0; i < pageImages.length; i++) {
        final image = pw.MemoryImage(pageImages[i]);
        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4.portrait,
            margin: pw.EdgeInsets.zero,
            build: (pw.Context context) {
              return pw.Container(
                width: PdfPageFormat.a4.portrait.width,
                height: PdfPageFormat.a4.portrait.height,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    if (i == 0)
                      pw.Container(
                        width: PdfPageFormat.a4.portrait.width,
                        color: const PdfColor.fromInt(0xFF000000),
                        // margin: const pw.EdgeInsets.only(bottom: 10),
                        padding: const pw.EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 8,
                        ),
                        child: pw.Image(
                          logoImage,
                          height: 20,
                        ),
                      ),
                    pw.Expanded(
                      child: pw.Container(
                        margin: const pw.EdgeInsets.only(top: 10),
                        alignment: pw.Alignment.topCenter,
                        child: pw.Image(
                          image,
                          width: PdfPageFormat.a4.portrait.width,
                          fit: pw.BoxFit.contain,
                        ),
                      ),
                    ),
                    if (i == pageImages.length - 1)
                      pw.Container(
                        width: PdfPageFormat.a4.portrait.width,
                        color: const PdfColor.fromInt(0xFF000000),
                        height: 30,
                        margin: const pw.EdgeInsets.only(top: 45),
                        padding: const pw.EdgeInsets.symmetric(horizontal: 30),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Text(
                              StringConst.copyrightText(
                                  DateTime.now().year.toString()),
                              style: pw.TextStyle(
                                font: font,
                                fontSize: 8,
                                color: const PdfColor.fromInt(0xFFFFFFFF),
                              ),
                            ),
                            pw.Row(
                              children: [
                                pw.Text(
                                  StringConst.termsAndConditionsFooter,
                                  style: pw.TextStyle(
                                    font: font,
                                    fontSize: 8,
                                    color: const PdfColor.fromInt(0xFFFFFFFF),
                                  ),
                                ),
                                pw.SizedBox(width: 10),
                                pw.Text(
                                  StringConst.contactUs,
                                  style: pw.TextStyle(
                                    font: font,
                                    fontSize: 8,
                                    color: const PdfColor.fromInt(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );

              // return pw.Stack(
              //   children: [
              //     pw.Positioned(
              //       top: i == 0 ? 60 : 10,
              //       left: 0,
              //       right: 0,
              //       child: pw.Image(image, fit: pw.BoxFit.contain),
              //     ),
              //     if (i == 0)
              //       pw.Positioned(
              //         top: 0,
              //         left: 0,
              //         right: 0,
              //         child: pw.Container(
              //           color: const PdfColor.fromInt(0xFF000000),
              //           margin: const pw.EdgeInsets.only(bottom: 60),
              //           padding: const pw.EdgeInsets.symmetric(
              //             horizontal: 60,
              //             vertical: 8,
              //           ),
              //           child: pw.Image(
              //             logoImage,
              //             height: 20,
              //           ),
              //         ),
              //       ),
              //     if (i == pageImages.length - 1)
              //       pw.Positioned(
              //         bottom: 0,
              //         left: 0,
              //         right: 0,
              //         child: pw.Container(
              //           color: const PdfColor.fromInt(0xFF000000),
              //           height: 30,
              //           margin: const pw.EdgeInsets.only(top: 45),
              //           padding: const pw.EdgeInsets.symmetric(horizontal: 30),
              //           child: pw.Row(
              //             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              //             crossAxisAlignment: pw.CrossAxisAlignment.center,
              //             children: [
              //               pw.Text(
              //                 StringConst.copyrightText,
              //                 style: pw.TextStyle(
              //                   font: font,
              //                   fontSize: 8,
              //                   color: const PdfColor.fromInt(0xFFFFFFFF),
              //                 ),
              //               ),
              //               pw.Row(
              //                 children: [
              //                   pw.Text(
              //                     StringConst.termsAndConditionsFooter,
              //                     style: pw.TextStyle(
              //                       font: font,
              //                       fontSize: 8,
              //                       color: const PdfColor.fromInt(0xFFFFFFFF),
              //                     ),
              //                   ),
              //                   pw.SizedBox(width: 10),
              //                   pw.Text(
              //                     StringConst.contactUs,
              //                     style: pw.TextStyle(
              //                       font: font,
              //                       fontSize: 8,
              //                       color: const PdfColor.fromInt(0xFFFFFFFF),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //   ],
              // );
            },
          ),
        );
      }

      // Get the PDF as bytes
      final Uint8List pdfBytes = await pdf.save();

      // Save or download the file
      await savePdfFile(
        pdfBytes,
        'SCAPE-$eventName Ticket.pdf',
        sizingInformation,
      );
    } else {
      throw StringConst.somethingWentWrong;
    }
  } catch (e) {
    print('Error generating PDF: $e');
    // Show an error message to the user
    customErrorSnackBar(context, message: 'Failed to generate PDF: $e');
  }
}
