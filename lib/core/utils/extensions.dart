import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:scape/core/helper/logger.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension RemoveAllWhiteSpace on String {
  String removeAllWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }
}

extension FormatAndConvertToDateString on String {
  String formatAndConvertToDateString() {
    final String val = this;
    // Check if the string is empty or null
    if (val.isEmpty) {
      logger.e("Empty date string provided.");
      return "Invalid date";
    }

    try {
      // Parse the string into a DateTime object
      DateTime formattedDateTime =
          DateFormat("M/d/yyyy hh:mm:ss a").parse(this);
      logger.e(formattedDateTime);

      // Format the DateTime object into the desired string format
      String expectedDateString =
          DateFormat("dd MMM yyyy hh:mm a").format(formattedDateTime);

      return expectedDateString;
    } catch (e) {
      logger.e("Error parsing date string: $e");
      return "Invalid date";
    }
  }
}

extension LoggerD on String {
  void loggerD() {
    return logger.d(this);
  }
}

extension LoggerE on String {
  void loggerE() {
    return logger.e(this);
  }
}

extension LoggerI on String {
  void loggerI() {
    return logger.i(this);
  }
}

extension LoggerW on String {
  void loggerW() {
    return logger.w(this);
  }
}

extension LoggerF on String {
  void loggerF() {
    return logger.f(this);
  }
}

extension ReadFromGetStorage on String {
  Future<String> readFromGetStorage() async {
    String value = "";
    var result = await GetStorage().read(this);
    if (result != null) {
      value = result;
    }
    return value;
  }
}
