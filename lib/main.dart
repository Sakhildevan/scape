import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scape/config/network/api_helper.dart';
import 'package:scape/core/helper/logger.dart';
import 'package:scape/core/utils/constants.dart';
import 'package:scape/core/utils/go_router.dart';
import 'package:scape/src/booking_confirmation/data/booking_confirm_datasource.dart';
import 'package:scape/src/booking_confirmation/data/booking_confirm_repository.dart';
import 'package:scape/src/booking_confirmation/presentation/bloc/booking_confirm_bloc.dart';
import 'package:scape/src/email-providing-view/data/data_source/email_providing_data_source.dart';
import 'package:scape/src/email-providing-view/data/repository/email_providing_repository.dart';
import 'package:scape/src/email-providing-view/presentation/bloc/email_providing_bloc.dart';
import 'package:scape/src/home/data/data_source/home_data_source.dart';
import 'package:scape/src/home/data/repository/home_repository.dart';
import 'package:scape/src/home/presentation/bloc/home_bloc.dart';
import 'package:scape/src/otp-verification-view/data/datasource/otp_verification_datasource.dart';
import 'package:scape/src/otp-verification-view/data/repository/otp_verification_repository.dart';
import 'package:scape/src/otp-verification-view/presentation/bloc/otp_verification_bloc.dart';
import 'package:scape/src/profile/data/data_source/profile_data_source.dart';
import 'package:scape/src/profile/data/repository/profile_repository.dart';
import 'package:scape/src/profile/presentation/bloc/profile_bloc.dart';
import 'package:scape/src/promo_code/data/data_source/promo_code_data_source.dart';
import 'package:scape/src/promo_code/data/repository/booking_admission_list.dart';
import 'package:scape/src/promo_code/presentation/bloc/promo_code_bloc.dart';
import 'package:scape/src/register/presentation/bloc/register_from_event_bloc.dart';
import 'package:scape/src/registration/data/data_source/registration_data_source.dart';
import 'package:scape/src/registration/data/repository/registration_repository.dart';
import 'package:scape/src/registration/presentation/bloc/registration_bloc.dart';
import 'package:scape/src/retrieve-myinfo-view/bloc/retrieve_info_bloc.dart';
import 'package:scape/src/retrieve-myinfo-view/data/datasource/retrieve_info_datasource.dart';
import 'package:scape/src/retrieve-myinfo-view/data/repository/retrieve_info_repository.dart';
import 'package:scape/src/start-booking/data/repository/start_booking_repository.dart';
import 'package:scape/src/start-booking/presentation/bloc/start_booking_bloc.dart';
import 'package:scape/src/ticket_booking/data/data_source/ticket_booking_data_source.dart';
import 'package:scape/src/ticket_booking/data/repository/ticket_booking_repository.dart';
import 'package:scape/src/ticket_details/data/data_source/ticket_details_data_source.dart';
import 'package:scape/src/ticket_details/data/repository/ticket_details_repostory.dart';
import 'package:scape/src/ticket_details/presentation/bloc/ticket_details_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/utils/string_constants.dart';
import 'src/participant_ticket/data/datasource/participant_datasource.dart';
import 'src/participant_ticket/data/repository/participant_repository.dart';
import 'src/participant_ticket/presentation/bloc/participant_ticket_bloc.dart';
import 'src/ticket_booking/presentation/bloc/ticket_booking_bloc.dart';
import 'dart:html' as html;

void main() async {
  setPathUrlStrategy();
  //!--------Commented out the below line as its already called in the GetStorage.init() method------
  // WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // Add Google Analytics script
  _addGoogleAnalytics();

  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(
      desktop: 800,
      tablet: 550,
      watch: 200,
    ),
  );
  runApp(
    const MyApp(),
  );
}

void _addGoogleAnalytics() {
  final String gaId = 'G-H6GMEDPDN2';

  // Add Google Analytics script
  final scriptElement = html.ScriptElement()
    ..src = 'https://www.googletagmanager.com/gtag/js?id=$gaId'
    ..async = true;
  html.document.head!.append(scriptElement);

  // Add GA initialization code
  final gaScript = html.ScriptElement()
    ..text = '''
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', '$gaId');
    ''';
  html.document.head!.append(gaScript);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final APIHelper apiHelper = APIHelper();
    logger.d("APP rebuilding");
    // Dynamically change the title on app initialization
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setTitle(StringConst.appTitle);
    });

    //Set device size
    Constants.updateDimensions(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );

    return MultiBlocProvider(
      //!----------Declare all the BloC here---------!
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            homeRepository: HomeRepository(
              homeDataSource: HomeDataSource(apiHelper),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => PromoCodeBloc(
            promoCodeRepository: PromoCodeRepository(
              promoCodeDataSource: PromoCodeDataSource(
                apiHelper,
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => StartBookingBloc(
            repository: StartBookingRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => EmailProvidingBloc(
            emailProvidingRepository: EmailProvidingRepository(
              emailProvidingDataSource: EmailProvidingDataSource(
                apiHelper,
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => OtpVerificationBloc(
            otpVerificationRepository: OtpVerificationRepository(
              otpVerificationDataSource: OtpVerificationDataSource(
                apiHelper,
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => RegisterFromEventBloc(),
        ),
        BlocProvider(
          create: (context) => RegistrationBloc(
            registrationRepository: RegistrationRepository(
              registrationDataSource: RegistrationDataSource(
                APIHelper(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ParticipantTicketBloc(
            participantRepository: ParticipantRepository(
              participantDataSource: ParticipantDataSource(
                apiHelper,
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            profileRepository: ProfileRepository(
              profileDateSource: ProfileDataSource(
                apiHelper,
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => TicketDetailsBloc(
            repository: TicketDetailsRepostory(
              ticketDetailsDataSource: TicketDetailsDataSource(apiHelper),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => TicketBookingBloc(
              repository: TicketBookingRepository(
                ticketBookingDataSource: TicketBookingDataSource(
                  apiHelper,
                ),
              ),
              profileRepository: ProfileRepository(
                  profileDateSource: ProfileDataSource(apiHelper))),
        ),
        BlocProvider(
          create: (context) => BookingConfirmBloc(
            repository: BookingConfirmationRepository(
              bookingConfirmDatasource: BookingConfirmDatasource(
                apiHelper,
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => RetrieveInfoBloc(
            retrieveInfoRepository: RetrieveInfoRepository(
              retrieveInfoDataSource: RetrieveInfoDataSource(
                apiHelper,
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.trackpad,
          },
        ),
        title: StringConst.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
          ),
          useMaterial3: true,
          checkboxTheme: const CheckboxThemeData(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.orange,
                width: 1.0,
              ), // Orange border
            ),
          ),
        ),
        routerConfig: MyRouter.router,
      ),
    );
  }

  void setTitle(String title) {
    // Set the title of the page
    html.document.title = title;
  }
}
