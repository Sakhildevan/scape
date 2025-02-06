import 'package:flutter/material.dart';
import 'package:scape/core/utils/asset_constants.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.content,
  });
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: double.infinity,
      color: AppColors.backgroundColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              AssetsConst.topLeft,
              height: Constants.width * 0.22,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              AssetsConst.bottomLeft,
              height: Constants.width * 0.22,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              AssetsConst.topRight,
              height: Constants.width * 0.22,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              AssetsConst.bottomRight,
              height: Constants.width * 0.22,
              fit: BoxFit.contain,
            ),
          ),
          content,
        ],
      ),
    );
  }
}
