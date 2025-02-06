import 'package:flutter/material.dart';
import 'package:scape/core/utils/asset_constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/text_styles.dart';

class AnimatedTextButton extends StatefulWidget {
  final String text;
  final bool smallDevice;
  final bool? showPrefixWidget;
  final double? fixedWidth;
  final bool? showSuffixWidget;
  final VoidCallback onPressed;

  const AnimatedTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.showPrefixWidget,
    this.showSuffixWidget,
    required this.smallDevice,
    this.fixedWidth,
  });

  @override
  State<AnimatedTextButton> createState() => _AnimatedTextButtonState();
}

class _AnimatedTextButtonState extends State<AnimatedTextButton>
    with TickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _backgroundController;
  late AnimationController _arrowController;
  late Animation<double> _backgroundAnimation;
  late Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();

    // Background wave animation controller
    _backgroundController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _backgroundAnimation =
        Tween<double>(begin: 0, end: 1).animate(_backgroundController);

    // Arrow animation controller
    _arrowController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Create a repeating arrow animation
    _arrowAnimation = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(
        parent: _arrowController,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    _arrowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.fixedWidth != null
        ? widget.fixedWidth!
        : !widget.smallDevice
            ? 170
            : 100;
    double width2x = width * 2;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          isHovered = true;
          _backgroundController.forward();
          _arrowController.repeat(reverse: true);
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
          _backgroundController.reverse();
          _arrowController.stop();
          _arrowController.reset();
        });
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: width,
          height: widget.smallDevice ? 45 : 55,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              // Light grey animation
              AnimatedBuilder(
                animation: _backgroundAnimation,
                builder: (context, child) {
                  return Positioned(
                    left: widget.showSuffixWidget != true
                        ? -width + (_backgroundAnimation.value * width2x)
                        : null,
                    right: widget.showSuffixWidget == true
                        ? -width + (_backgroundAnimation.value * width2x)
                        : null,
                    child: Container(
                      width: width,
                      height: 55,
                      color: AppColors.grey.withOpacity(0.3),
                    ),
                  );
                },
              ),
              // Medium grey animation (delayed)
              AnimatedBuilder(
                animation: _backgroundAnimation,
                builder: (context, child) {
                  return Positioned(
                    left: widget.showSuffixWidget != true
                        ? -width2x + (_backgroundAnimation.value * width2x)
                        : null,
                    right: widget.showSuffixWidget == true
                        ? -width2x + (_backgroundAnimation.value * width2x)
                        : null,
                    child: Container(
                      width: width,
                      height: 55,
                      color: AppColors.grey.withOpacity(0.6),
                    ),
                  );
                },
              ),
              // Text and Arrow
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.showPrefixWidget == true)
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Transform.translate(
                          offset: Offset(_arrowAnimation.value, 0),
                          child: Image.asset(
                            AssetsConst.forward,
                            width: widget.smallDevice ? 20 : 30,
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Kstyles().semibold(
                        text: widget.text,
                        size: widget.smallDevice ? 13 : 16,
                        color: AppColors.black,
                      ),
                    ),
                    if (widget.showSuffixWidget == true)
                      Transform.translate(
                        offset: Offset(_arrowAnimation.value, 0),
                        child: Image.asset(
                          AssetsConst.backward,
                          width: widget.smallDevice ? 15 : 30,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
