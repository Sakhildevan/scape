// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:scape/core/utils/common_widgets/background_widget.dart';
// import 'package:scape/core/utils/constants.dart';
// import 'package:scape/core/utils/styles/app_colors.dart';
// import 'package:scape/src/home/presentation/view/widgets/retrieve_myinfo_button.dart';
// import 'package:scape/src/email-providing-view/presentation/view/email_providing_view.dart';
// import 'package:scape/src/otp-verification-view/presentation/view/otp_verification_view.dart';
// import 'package:scape/src/promo_code/presentation/view/promo_code_page.dart';
// import 'package:scape/src/home/presentation/bloc/home_bloc.dart';
// import 'package:scape/src/home/presentation/view/widgets/appbar_logo.dart';
// import 'package:scape/src/home/presentation/view/widgets/footer.dart';
// import 'package:scape/src/home/presentation/view/widgets/next_btn.dart';
// import 'package:scape/src/home/presentation/view/widgets/previous_btn.dart';
// import 'package:scape/src/retrieve-myinfo-view/presentation/view/retrieve_myinfo_view.dart';

// import '../../../booking_confirmation/presentation/view/booking_confirmation__page.dart';
// import '../../../ticket_booking/presentation/view/ticket_booking_details.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: ResponsiveBuilder(
//         builder: (
//           BuildContext context,
//           SizingInformation sizingInformation,
//         ) =>
//             _buildBody(),
//       ),
//     );
//   }

// //Build Body
//   Widget _buildBody() {
//     return Container(
//       height: Constants.height,
//       color: AppColors.black,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const AppBarLogo(),
//                   _contentSection(),
//                 ],
//               ),
//             ),
//           ),
//           // _nextPreviousBtnSection(),
//           const Footer(),
//         ],
//       ),
//     );
//   }

//   // //Build Next previous button section
//   // Widget _nextPreviousBtnSection() {
//   //   return Container(
//   //     color: AppColors.white,
//   //     height: 80,
//   //     padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.1),
//   //     child: BlocBuilder<HomeBloc, HomeState>(
//   //       builder: (context, state) {
//   //         return state.selectedIndex == 2
//   //             ? const Align(
//   //                 alignment: Alignment.centerRight,
//   //                 child: RetrieveButton(),
//   //               )
//   //             : Row(
//   //                 mainAxisAlignment: MainAxisAlignment.start,
//   //                 children: [
//   //                   if (state.selectedIndex != 0) const PreviousButton(),
//   //                   const Spacer(),
//   //                   const NextButton(),
//   //                 ],
//   //               );
//   //       },
//   //     ),
//   //   );
//   // }

// //Content section
//   Widget _contentSection() {
//     return BackgroundWidget(
//       useFrame: true,
//       content: BlocBuilder<HomeBloc, HomeState>(
//         builder: (ctx, state) {
//           return _showSelectedIndexContent(state);
//         },
//       ),
//     );
//   }

//   //Show selected index content
//   Widget _showSelectedIndexContent(HomeState state) {
//     switch (Pages.values[state.selectedIndex]) {
//       //!--- EmailProviding page---
//       case Pages.emailProviding:
//         return const EmailProvidingView();
//       //!--- OTPValidation page---
//       case Pages.otpValidation:
//         return const OtpVerificationView();
//       //!--- Retrieve Info page---
//       case Pages.retrieveInfoPage:
//         return const RetrieveMyInfoView();

//       //!--- TicketBookingDetail page---
//       case Pages.ticketBooking:
//         return const TicketBookingDetail();
//       //!--- PromoCodeDetails page---
//       case Pages.promoCode:
//         return const PromoCodeDetails();
//       //todo:
//       case Pages.bookingConfirmation:
//         return const BookingConfirmationPage();
//       //!-----Payment page---

//       default:
//         return const EmailProvidingView();
//     }
//   }
// }
