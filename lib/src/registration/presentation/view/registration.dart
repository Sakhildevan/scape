import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/config/analytics.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/common_widgets/custom_view/custom_view.dart';
import 'package:scape/core/utils/common_widgets/loading_widgets/popup_loading.dart';
import 'package:scape/core/utils/common_widgets/popup_message_widget.dart';
import 'package:scape/core/utils/enums.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/core/utils/styles/dimensions.dart';
import 'package:scape/src/home/presentation/bloc/home_bloc.dart';
import 'package:scape/src/otp-verification-view/presentation/bloc/otp_verification_bloc.dart';
import 'package:scape/src/registration/presentation/bloc/registration_bloc.dart';
import 'package:scape/src/registration/presentation/view/first_last_name_view.dart';
import 'package:scape/src/registration/presentation/view/login_view.dart';
import 'package:scape/src/registration/presentation/view/otp_view.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void initState() {
    //Analytics
    Analytics.logEvent("Login page viewed", {
      "event": "Login page viewed",
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) async {
        if (state.apiStatus == ApiStatus.failure) {
          if (state.confirmOtpApi) {
          } else {
            popupMessageWidget(context, state.errorMessage);
          }
        } else if (state.apiStatus == ApiStatus.loading) {
          popupLoading(context);
        } else if (state.apiStatus == ApiStatus.completed) {
          context.pop();
        } else if (state.apiStatus == ApiStatus.success) {
          if (state.canNavigate) {
            context.read<RegistrationBloc>().add(const SetInitialEvent());
            if (state.registrationSuccess == true) {
              context.read<OtpVerificationBloc>().add(MyProfileUpdateQuizEvent(
                    context: context,
                  ));
            } else {
              logger.i("navigating after login");
              context.go(StringConst.profileViewRoute);
            }
            //
          } else if (state.registrationSuccess) {
            // customSnackBar(context,
            //     message: StringConst.registrationCompletedSuccessfully);
          }
        }
      },
      builder: (context, state) {
        return CustomView(
          isFromProfile: false,
          showLogout: false,
          contentWidget: _buildBody(state.selectedIndex),
        );
      },
    );
  }

//Content section
  Widget _buildBody(int selectedIndex) {
    return BlocListener<OtpVerificationBloc, OtpVerificationState>(
      listener: (context, state) {
        if (state.initialApiStatus == ApiStatus.loading) {
          popupLoading(context);
        } else if (state.initialApiStatus == ApiStatus.completed) {
          context.pop();
        } else if (state.initialApiStatus == ApiStatus.failure) {
          popupMessageWidget(context, state.errorMessage);
        }
      },
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizingInformation.isMobile ? 20 : 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              KDimension().kHeight60,
              SizedBox(
                width: sizingInformation.screenSize.width > 800
                    ? 700
                    : sizingInformation.screenSize.width,
                // padding: const EdgeInsets.symmetric(horizontal: 40),
                child: _showSelectedIndexContent(selectedIndex),
              ),
              KDimension().kHeight100,
              KDimension().kHeight20,
            ],
          ),
        ),
      ),
    );
  }

  //Show selected index content
  Widget _showSelectedIndexContent(int selectedIndex) {
    switch (Pages.values[selectedIndex]) {
      case Pages.login:
        return EmailView(
          emailController: emailController,
        );
      case Pages.registration:
        return FirstNameLastNameView(
          firstNameEditingController: firstNameController,
          lastNameEditingController: lastNameController,
          emailEditingController: emailController,
        );
      case Pages.otp:
        return const OTPView();
      default:
        return EmailView(
          emailController: emailController,
        );
    }
  }
}
