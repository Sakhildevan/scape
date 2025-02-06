import 'package:flutter/material.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/text_styles.dart';

class EventDescWithScroll extends StatelessWidget {
  const EventDescWithScroll(
      {super.key,
      required this.description,
      required this.onTap,
      required this.scrollController});
  final String description;
  final ScrollController scrollController;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _eventDescriptionVisible(description, context),
            GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Kstyles()
                    .med(text: "Show less", color: AppColors.orange, size: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _eventDescriptionVisible(String value, BuildContext context) {
    return Kstyles().med(
      text: value,
      size: 14,
      overflow: TextOverflow.visible,
    );
  }
}
