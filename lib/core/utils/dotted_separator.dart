import 'package:flutter/material.dart';
import 'package:scape/core/utils/styles/app_colors.dart';

class DottedSeparator extends StatelessWidget {
  final double height;
  final double dashLength;
  final double dashGapLength;
  final Color color;

  const DottedSeparator({
    super.key,
    this.height = 2,
    this.dashLength = 6,
    this.dashGapLength = 6,
    this.color = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (dashLength + dashGapLength)).floor();

        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashLength,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
