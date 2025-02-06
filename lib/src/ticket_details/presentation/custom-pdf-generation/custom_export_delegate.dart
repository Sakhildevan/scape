import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'dart:math' as math;
import 'package:responsive_builder/responsive_builder.dart';

class CustomExportDelegate extends ExportDelegate {
  final GlobalKey contentKey;
  // final double scaleFactor;
  // final double cropFactor; // New crop factor to show more content per page

  CustomExportDelegate(
    this.contentKey,

    // {this.scaleFactor = 1, this.cropFactor = 1.0
    // }
  );

  @override
  Future<List<Uint8List>> captureImages(
      String frameId, SizingInformation sizingInformation,
      {double? pixelRatio,
      double maxWidth = 595,
      double maxHeight = 842}) async {
    // Get the boundary of the widget we want to capture
    RenderRepaintBoundary boundary =
        contentKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    // double scaleFactor = 0.7;
    // double cropFactor = 1.66;
    double scaleFactor = 0.7;
    double cropFactor = sizingInformation.isDesktop
        ? 1.66
        : sizingInformation.isTablet
            ? 1.18
            : 1.2;

    // Get the full size of the widget/content
    final size = boundary.size;
    final effectivePixelRatio = (pixelRatio ?? 1.0) * scaleFactor;
    print(size.width);

    // Calculate the scaled height of the content and determine how much to crop per page
    final scaledHeight = size.height * scaleFactor;
    final adjustedPageHeight =
        maxHeight * cropFactor; // Adjusted height for more content per page

    // Calculate the total number of pages required based on adjusted height
    final pageCount = (scaledHeight / adjustedPageHeight).ceil();

    List<Uint8List> pages = [];

    for (int i = 0; i < pageCount; i++) {
      // Capture the image from the widget at a given pixel ratio
      final ui.Image image =
          await boundary.toImage(pixelRatio: effectivePixelRatio);

      // Calculate where to start cropping for each page
      int startY = (i * adjustedPageHeight / scaleFactor).round();
      int height = math.min((adjustedPageHeight / scaleFactor).round(),
          (size.height - startY).round());

      // Crop the image to fit the portion for the current page
      ui.Image croppedImage = await cropImage(
          image,
          0,
          (startY * scaleFactor).round(),
          (size.width * effectivePixelRatio).round(),
          (height * effectivePixelRatio).round());

      // Convert the cropped image into a ByteData format
      final ByteData? croppedByteData =
          await croppedImage.toByteData(format: ui.ImageByteFormat.png);

      if (croppedByteData != null) {
        // Add the current cropped image to the list of pages
        pages.add(croppedByteData.buffer.asUint8List());
      }
    }

    return pages;
  }

  Future<ui.Image> cropImage(
      ui.Image image, int x, int y, int width, int height) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final paint = Paint()..filterQuality = FilterQuality.high;

    // Draw the cropped portion of the image on the canvas
    canvas.drawImage(image, Offset(-x.toDouble(), -y.toDouble()), paint);

    final croppedPicture = pictureRecorder.endRecording();
    return croppedPicture.toImage(width, height);
  }
}
