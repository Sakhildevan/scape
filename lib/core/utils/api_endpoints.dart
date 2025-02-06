// ignore_for_file: constant_identifier_names

class APIEndpoints {
//   static const String APIBaseURL = "https://eventhub.scape.sg/api/"; // Live
  static const String APIBaseURL =
      "https://scapeoneevents.strat-staging.com/api/"; // Staging
  static const String getUserEndpoints = "";
  static const String myProfileUpdateQuiz = "myprofileupdatequiz";
  static const String getEventEndpoints = "eventinfo";
  static const String getEventWithLimitEndpoints = "eventinfowithpackagelimits";
  static const String loginWithEmailEndpoints = "loginwithemail";
  // static const String registerWithEmailEndpoints = "registerwithemailandname";
  static const String registerWithEmailEndpoints =
      "registerwithprofileandmarketingconsent";
  static const String confirmOtpEndpoints = "loginwithemailconfirmwithotp";
  static const String checkMemberExistsEndpoints = "checkmemberexists";
  static const String checkMemberIsActiveEndpoints = "checkmemberisactive";
  static const String bookingSessionCreate = "bookingsessioncreate";
  static const String bookingSessionGet = "bookingsessionget";
  static const String bookingSessionMultipleTicketAdd =
      "bookingsessionpackagemultipleticketadd";
  static const String bookingSessionPackageAddDummy =
      "bookingsessionpackageadddummy";
  static const String bookingSessionPackageUpdate =
      "bookingsessionpackageupdate";
  static const String bookingSessionCheckAllParticipantsUpdated =
      "bookingsessioncheckallparticipantsupdated";
  static const String getTicketFromBookingSession =
      "getticketfrombookingsession";
  static const String getMyTickets = "gettickets";
  static const String postProfileName = "myprofileupdatename";
  static const String updateMyProfileMarketingConsent =
      "myprofilechangemarketingconsent";
  static const String updateEmail = "myprofileupdateemail";
  static const String updateEmailFinalize = "myprofileupdateemailfinalize";
  static const String staticPage = "staticpage";
  static const String getMyProfile = "myprofileget";
  static const String myInterestUpdateStatus = "myinterestupdatestatus";
  static const String myProfileAddMoreInterest = "myprofileaddmoreinterest";
  static const String myProfileDeleteMoreInterest =
      "myprofiledeletemoreinterest";
  static String getTicket(String ticketCode) =>
      "getticket?TicketCode=$ticketCode";
  static String getParticipant(String ticketCode) =>
      "getparticipantticket?TicketCode=$ticketCode";
  static String getDynamicTicket(String referenceCode) =>
      "getdynamicqrcode?ParticipantBookingReference=$referenceCode";
  static const String bookingSessionPromoCode = "bookingsessionpromocodeadd";
  static const String bookingSessionRemovePromoCode =
      "bookingsessionpromocoderemove";
  static const String bookingSessionFreeBooking = "bookingsessionisfreebooking";
  static const String bookingSessionConfirmFreeBooking =
      "bookingsessionconfirmfreebooking";
  static const String bookingSessionPaymentUrl = "bookingsessiongetpaymenturl";
  static const String bookingSessionValidatePayment =
      "bookingsessionpaymentretrunvalidator";
  static const String bookingSessionAddPackageAllowed =
      "bookingsessionpackageaddisallowed";
  static const String bookingSessionChangeNameAllowed =
      "bookingsessionpackageaddnamechangeisallowed";
  static const String bookingSessionAddPackage = "bookingsessionpackageadd";
  static const String bookingSessionDeletePackage =
      "bookingsessionpackagedelete";
  static const String checkSingPassVerificationEndpoints = "singpassisvarified";
  static const String singPassRedirectionEndpoint = "singpassvarify";
  static const String checkLoginIsValidEndpoint = "checkloginisvalid";
  static String singPassVerifyEndpoint(String token) =>
      "singpassvalidateredirect?returntoken=$token";
}
