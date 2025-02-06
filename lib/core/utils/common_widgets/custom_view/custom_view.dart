import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/common_func.dart';
import 'package:scape/core/utils/common_widgets/background_widget.dart';
import 'package:scape/core/utils/common_widgets/custom_view/app_bar_logo.dart';
import 'package:scape/core/utils/common_widgets/custom_view/footer.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/src/home/presentation/bloc/home_bloc.dart';

class CustomView extends StatefulWidget {
  final Widget contentWidget;
  final Widget? bottomButtonWidget;
  final bool useFrame;
  final bool? hideNextPreviousBtn;
  final bool showLogout;
  final bool isFromProfile;

  const CustomView({
    super.key,
    required this.contentWidget,
    this.bottomButtonWidget,
    required this.showLogout,
    required this.isFromProfile,
    this.useFrame = true,
    this.hideNextPreviousBtn,
  });

  @override
  State<CustomView> createState() => _CustomViewState();
}

class _CustomViewState extends State<CustomView> {
  late ScrollController _scrollController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _scrollController = ScrollController();

    // Request focus when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ResponsiveBuilder(
        builder: (
          BuildContext context,
          SizingInformation sizingInformation,
        ) =>
            _buildBody(sizingInformation),
      ),
    );
  }

  // Build Body
  Widget _buildBody(SizingInformation sizingInformation) {
    return SizedBox(
      height: Constants.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarLogo(
                  isFromProfile: widget.isFromProfile,
                  showLogout: widget.showLogout,
                ),
                Expanded(child: _contentSection(sizingInformation)),
              ],
            ),
          ),
          // if (widget.hideNextPreviousBtn == null ||
          //     widget.hideNextPreviousBtn == true)
          //   widget.bottomButtonWidget,
          if (!sizingInformation.isMobile) const Footer(),
        ],
      ),
    );
  }

  // Content section
  Widget _contentSection(SizingInformation sizingInformation) {
    return BackgroundWidget(
      content: KeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKeyEvent: (KeyEvent event) {
          keyboardScrollEvent(event, _scrollController);
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (ctx, state) => SizedBox(
              width: sizingInformation.screenSize.width > 1400
                  ? 1400
                  : sizingInformation.screenSize.width,
              child: sizingInformation.isMobile
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.contentWidget,
                        const Footer(),
                      ],
                    )
                  : widget.contentWidget,
            ),
          ),
        ),
      ),
    );
  }
}
