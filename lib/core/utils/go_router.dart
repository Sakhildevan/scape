import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scape/config/analytics_route_observer.dart';
import 'package:scape/core/utils/string_constants.dart';
import 'package:scape/src/booking_confirmation/presentation/view/booking_confirmation_page.dart';
import 'package:scape/src/email-providing-view/presentation/view/email_providing_view.dart';
import 'package:scape/src/logout/logout.dart';
import 'package:scape/src/otp-verification-view/presentation/view/otp_verification_view.dart';
import 'package:scape/src/profile/presentation/view/profile_view.dart';
import 'package:scape/src/promo_code/presentation/view/promo_code_page.dart';
import 'package:scape/src/register/presentation/view/register_from_event_view.dart';
import 'package:scape/src/registration/presentation/view/registration.dart';
import 'package:scape/src/retrieve-myinfo-view/presentation/view/retrieve_myinfo_view.dart';
import 'package:scape/src/start-booking/presentation/view/start_booking_view.dart';
import 'package:scape/src/ticket_booking/presentation/view/ticket_booking_view.dart';
import 'package:scape/src/ticket_details/presentation/view/ticket_details_view.dart';

import '../../src/participant_ticket/presentation/view/participant_ticket_view.dart';

class MyRouter {
  /// The route configuration.
  static final GlobalKey<NavigatorState> _rootNavKey =
      GlobalKey<NavigatorState>();
  static final analyticsObserver = AnalyticsRouteObserver();

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavKey,
    observers: [analyticsObserver],
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: StringConst.initialPath,
        builder: (BuildContext context, GoRouterState state) {
          return ProfileView();
        },
      ),
      GoRoute(
        path: "${StringConst.startBookingViewRoute}/:${StringConst.eventKey}",
        name: StringConst.startBookingViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          String? eventKey = state.pathParameters[StringConst.eventKey];
          return StartBookingView(
            key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
            eventKey: eventKey ?? "",
          );
        },
      ),
      GoRoute(
        path: StringConst.emailProvidingViewRoute,
        name: StringConst.emailProvidingViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const EmailProvidingView();
        },
      ),
      // GoRoute(
      //   path: "${StringConst.emailProvidingViewRoute}/:${StringConst.eventKey}",
      //   name: StringConst.emailProvidingViewRoute,
      //   builder: (BuildContext context, GoRouterState state) {
      //     String? eventKey = state.pathParameters[StringConst.eventKey];
      //     return EmailProvidingView(
      //       key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      //       eventKey: eventKey ?? "",
      //     );
      //   },
      // ),
      GoRoute(
        path: StringConst.registerFromEventViewRoute,
        name: StringConst.registerFromEventViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          // final memberExistsActive =
          //     extra[StringConst.memberExistsActiveKey] as bool?;
          // final tempLoginToken = extra[StringConst.tempLoginToken] as String?;
          final email = extra[StringConst.emailKey] as String?;
          return RegisterFromEventView(
            key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
            // tempLoginToken: tempLoginToken,
            email: email,
          );
        },
      ),
      GoRoute(
        path: StringConst.otpViewRoute,
        name: StringConst.otpViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          final tempLoginToken = extra[StringConst.tempLoginToken] as String?;
          final email = extra[StringConst.emailKey] as String?;
          final isFromRegistration =
              extra[StringConst.isFromRegistrationKey] as bool?;
          return OtpVerificationView(
            key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
            tempLoginToken: tempLoginToken,
            email: email,
            isFromRegistration: isFromRegistration,
          );
        },
      ),
      GoRoute(
        path: StringConst.retrieveMyInfoViewRoute,
        name: StringConst.retrieveMyInfoViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          final token = state.uri.queryParameters['returntoken'];
          return RetrieveMyInfoView(token: token ?? "");
        },
      ),
      GoRoute(
        path: StringConst.ticketBookingViewRoute,
        name: StringConst.ticketBookingViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const TicketBookingView();
        },
        // onExit: (context, state) {
        //   print("#######################################3");
        //   print(state.fullPath);
        //   return false;
        // },
      ),
      GoRoute(
        path: StringConst.promoCodeViewRoute,
        name: StringConst.promoCodeViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          final token = state.uri.queryParameters['returntoken'];
          return PromoCodeDetails(
            paymentReturnToken: token ?? '',
          );
        },
      ),
      GoRoute(
        path: StringConst.bookingConfirmationViewRoute,
        name: StringConst.bookingConfirmationViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const BookingConfirmationPage();
        },
      ),
      GoRoute(
        path: StringConst.profileViewRoute,
        name: StringConst.profileViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return ProfileView();
        },
      ),
      GoRoute(
        path:
            "${StringConst.ticketDetailsViewRoute}/:${StringConst.ticketcode}",
        name: StringConst.ticketDetailsViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          String? ticketCode = state.pathParameters[StringConst.ticketcode];
          return TicketDetailsView(
            ticketCode: ticketCode ?? '',
          );
        },
      ),
      GoRoute(
        path: StringConst.registrationViewRoute,
        name: StringConst.registrationViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const Registration();
        },
      ),
      GoRoute(
        path: StringConst.logoutViewRoute,
        name: StringConst.logoutViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const LogoutView();
        },
      ),
      GoRoute(
        path: "${StringConst.participantViewRoute}/:${StringConst.ticketcode}",
        name: StringConst.participantViewRoute,
        builder: (BuildContext context, GoRouterState state) {
          String? ticketCode = state.pathParameters[StringConst.ticketcode];
          return ParticipantTicketView(
            ticketCode: ticketCode ?? '',
          );
        },
      ),
    ],
  );
}
