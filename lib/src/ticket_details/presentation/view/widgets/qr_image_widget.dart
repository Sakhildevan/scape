import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImageWidget extends StatelessWidget {
  const QRImageWidget(
      {super.key,
      required this.value,
      required this.size,
      required this.logoSize,
      required this.textSize});

  final String value;
  final double size;
  final double logoSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        QrImageView(
          data: value,
          version: QrVersions.auto,
          size: size,
          padding: const EdgeInsets.all(5),
        ),
        // Container(
        //   width: logoSize,
        //   height: logoSize,
        //   decoration: const BoxDecoration(
        //     color: Colors.black,
        //     shape: BoxShape.circle,
        //   ),
        //   child: Center(
        //     child: Kstyles().reg(
        //       text: "SCAPE",
        //       size: textSize,
        //       color: AppColors.white,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
