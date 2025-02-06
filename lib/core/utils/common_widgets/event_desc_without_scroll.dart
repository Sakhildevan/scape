import 'package:flutter/material.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/text_styles.dart';

class EventDescWithoutScroll extends StatelessWidget {
  const EventDescWithoutScroll(
      {super.key,
      required this.description,
      required this.onTap,
      this.maxLines});
  final String description;
  final int? maxLines;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Kstyles().med(
          text: description,
          maxLines: maxLines ?? 3,
          size: 14,
          overflow: TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: onTap,
          child: Kstyles().med(
            text: "Show more",
            color: AppColors.orange,
            size: 12,
          ),
        ),
      ],
    );
  }
}
