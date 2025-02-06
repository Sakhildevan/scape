import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/styles/app_colors.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/core/utils/styles/text_styles.dart';
import 'package:scape/src/ticket_details/presentation/bloc/ticket_details_bloc.dart';

class TermAndConditionAlertBox extends StatefulWidget {
  const TermAndConditionAlertBox({super.key});

  @override
  State<TermAndConditionAlertBox> createState() =>
      _TermAndConditionAlertBoxState();
}

class _TermAndConditionAlertBoxState extends State<TermAndConditionAlertBox> {
  @override
  void initState() {
    context.read<TicketDetailsBloc>().add(const GetStaticPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
          scrollable: true,
          contentPadding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          backgroundColor: AppColors.white,
          content: Stack(
            children: [
              Container(
                height: Constants.width > 1430
                    ? Constants.height * 0.6
                    : Constants.height * 0.75,
                width: Constants.width > 1430
                    ? Constants.width * 0.55
                    : Constants.width * 0.75,
                padding: EdgeInsets.symmetric(
                  horizontal: getValueForScreenType(
                    context: context,
                    mobile: 10,
                    tablet: 15,
                    desktop: 20,
                  ),
                  vertical: getValueForScreenType(
                    context: context,
                    mobile: 10,
                    tablet: 10,
                    desktop: 20,
                  ),
                ),
                child: BlocBuilder<TicketDetailsBloc, TicketDetailsState>(
                  builder: (context, state) {
                    return state.apiStatus == ApiStatus.loading
                        ? Center(
                            child: JumpingDots(
                              innerPadding: 3,
                              color: AppColors.orange,
                              radius: 20,
                              numberOfDots: 5,
                            ),
                          )
                        : state.apiStatus == ApiStatus.failure
                            ? Center(
                                child:
                                    Kstyles().med14(text: state.errorMessage),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // KDimension().kHeight15,
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: getValueForScreenType(
                                          context: context,
                                          mobile: 0,
                                          tablet: 20,
                                          desktop: 25,
                                        ),
                                      ),
                                      child: HtmlWidget(
                                        ''' ${state.staticPageModel?.staticPage?.replaceAll('&lt;', '<').replaceAll('&gt;', '>').replaceAll('&quot;', '"').replaceAll('&amp;', '&') ?? ''} ''',
                                      ),
                                    ),
                                    KDimension().kHeight20,
                                  ],
                                ),
                              );
                  },
                ),
              ),
              _closeBtn(context),
            ],
          )),
    );
  }

  //close icon
  Widget _closeBtn(BuildContext context) {
    return Positioned(
      right: 0,
      child: IconButton(
        icon: Icon(
          Icons.close,
          color: AppColors.red,
          size: getValueForScreenType(
            context: context,
            mobile: 20,
            tablet: 25,
            desktop: 30,
          ),
        ),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
