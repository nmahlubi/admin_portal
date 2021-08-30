import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:url_launcher/url_launcher.dart';

import 'date_formats.dart';

class CoreHelpers {
  static const savedUserKey = 'savedUserKey';
  static const firstOpenKey = 'firstOpenKey';
  static const String redirectUrl =
      "https://www.facebook.com/connect/login_success.html";
  static const String fbId = "2365251450450860";

  static void setupLanguage() {
    try {
      initializeDateFormatting('en', null);
      initializeDateFormatting('en_US,', null);
    } catch(error, stackTrace) {
      print("Error: ${error.toString()}");
    }
  }

  static String getDeviceType() {
    if(kIsWeb) {
      return "WEB";
    } else if (Platform.isIOS) {
      return "IOS";
    } else if (Platform.isAndroid) {
      return "ANDROID";
    } else {
      return "UNKNOWN";
    }
  }

  static Future<void> openLink(link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not open the link.';
    }
  }

  static String validateRegistrationDetails(
      String firstNameText,
      String lastNameText,
      String emailText,
      String cellNumberText,
      String passwordText,
      String verifyPasswordText,
      String termsText) {
    String errorMessage;
    String cellValidationError = validateMobile(cellNumberText);
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailText);

    if (firstNameText.isEmpty) {
      errorMessage = "Please enter your first name";
    } else if (lastNameText.isEmpty) {
      errorMessage = "Please enter your last name";
    } else if (emailText.isEmpty || !emailValid) {
      errorMessage = "Please enter a valid email address";
    } else if (cellValidationError != null) {
      errorMessage = cellValidationError;
    } else if (passwordText.isEmpty) {
      errorMessage = "Please enter your password";
    } else if (verifyPasswordText.isEmpty) {
      errorMessage = "Please Verify Your Password";
    } else if (passwordText != verifyPasswordText) {
      errorMessage = "Passwords do not match. Please re-enter password.";
    } else if (termsText.isEmpty || termsText != "true") {
      errorMessage = "Please accept our T’s & C’s to continue";
    }

    return errorMessage;
  }

  static String validateAdditionalLoginInfo(
      String firstNameText,
      String lastNameText,
      String emailText,
      String cellNumberText) {
    String errorMessage;
    String cellValidationError = validateMobile(cellNumberText);
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailText);

    if (firstNameText.isEmpty) {
      errorMessage = "Please enter your first name";
    } else if (lastNameText.isEmpty) {
      errorMessage = "Please enter your last name";
    } else if (emailText.isEmpty || !emailValid) {
      errorMessage = "Please enter a valid email address";
    } else if (cellValidationError != null) {
      errorMessage = cellValidationError;
    }

    return errorMessage;
  }
  static String validateMilestoneDetails(
      String titleText,
      String descriptionText,
      ) {
    String errorMessage;

    if (titleText.isEmpty) {
      errorMessage = "Please Enter Your Title";
    } else if (descriptionText.isEmpty) {
      errorMessage = "Please Enter Your Description";
    }

    return errorMessage;
  }
  static String validatePersonalDetails(
    String firstNameText,
    String lastNameText,
    String emailText,
    String cellNumberText,
  ) {
    String errorMessage;
    String cellValidationError = validateMobile(cellNumberText);
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailText);

    if (firstNameText.isEmpty) {
      errorMessage = "Please Enter Your First Name";
    } else if (lastNameText.isEmpty) {
      errorMessage = "Please Enter Your Last Name";
    } else if (emailText.isEmpty || !emailValid) {
      errorMessage = "Please Enter A Valid Email Address";
    } else if (cellValidationError != null) {
      errorMessage = cellValidationError;
    }

    return errorMessage;
  }

  static String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    String str = value.replaceAll("+", "");
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (!regExp.hasMatch(str)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  static String validateChildDetails(
      String firstName, String lastName, String isOwnChild) {
    String errorMessage;
    if (firstName.isEmpty) {
      errorMessage = "Please enter the First Name";
    } else if (lastName.isEmpty) {
      errorMessage = "Please enter the Last Name";
    } else if (isOwnChild.isEmpty) {
      errorMessage = "Please select the tick box to continue";
    }

    return errorMessage;
  }

  static String validateCommunityMemberDetails(
      String firstNameText,
      String lastNameText,
      String emailText,
      String cellNumberText,
      String relation,
      String accessLevel) {
    String errorMessage;
    String cellValidationError = validateMobile(cellNumberText);
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailText);

    if (firstNameText.isEmpty) {
      errorMessage = "Please Enter Your First Name";
    } else if (lastNameText.isEmpty) {
      errorMessage = "Please Enter Your Last Name";
    } else if (emailText.isEmpty || !emailValid) {
      errorMessage = "Please Enter A Valid Email Address";
    } else if (cellValidationError != null) {
      errorMessage = cellValidationError;
    } else if (relation.isEmpty) {
      errorMessage = "Please select the relation";
    } else if (accessLevel.isEmpty) {
      errorMessage = "Please select the access level";
    }

    return errorMessage;
  }

  static String getAccessLevelsEnum(String accessRightDescription) {
    switch (accessRightDescription) {
      case "Access level 1 – limited admin rights":
        return "LIMITED";
      case "Access level 2 – unlimited admin right, i.e. create, view, edit and delete schedules":
        return "UNLIMITED";
      default:
        return null;
    }
  }


  static String getFrequencyTypeEnum(String frequencyDescription) {
    switch (frequencyDescription) {
      case "Once Off":
        return "ONCE_OFF";
      case "Every Day":
        return "DAILY";
      case "Every Work Day":
        return "DAILY_NO_WEEKENDS";
      case "Every Week":
        return "WEEKLY_SAME_DAY";
      case "Every Month":
        return "MONTHLY_SAME_DAY";
      case "Custom":
        return "CUSTOM";
      default:
        return null;
    }
  }

  static String getCustomFrequencyTypeEnum(String customFrequencyDescription) {
    switch (customFrequencyDescription) {
      case "Weekly":
        return "WEEKLY";
      case "Monthly":
        return "MONTHLY";
      default:
        return null;
    }
  }

  static String getMonthlyRepeatOptionTypeEnum(String monthlyRepeatOptionDescription) {
    switch (monthlyRepeatOptionDescription) {
      case "On the week day":
        return "WEEK_DAY";
      case "On the month day":
        return "MONTH_DAY";
      default:
        return null;
    }
  }

  static bool isToday(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day) ==
        DateTime(date.year, date.month, date.day);
  }

  static bool isPastDate(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day).isAfter(DateTime(date.year, date.month, date.day));
  }

  static bool isTomorrow(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day + 1) ==
        DateTime(date.year, date.month, date.day);
  }

  static String getFormattedDate(DateTime date) {
    String day;
    if (isToday(date)) {
      day = "Today ${activityGroupCloseDateFormat.format(date)}";
    } else if (isTomorrow(date)) {
      day = "Tomorrow ${activityGroupCloseDateFormat.format(date)}";
    } else {
      day = activityGroupDateFormat.format(date);
    }

    return day;
  }

  static bool startsInNext30Minutes(DateTime date) {
    DateTime now = DateTime.now();
    DateTime date2 = DateTime(now.year, now.month, now.day, now.hour, now.minute + 30, now.second);
    return date.isBefore(date2);
  }

  static String validateAdvertDetails(
      String firstName, String lastName, String isOwnChild) {
    String errorMessage;
    if (firstName.isEmpty) {
      errorMessage = "Please enter the advert title";
    } else if (lastName.isEmpty) {
      errorMessage = "Please enter the advert subtitle";
    } else if (isOwnChild.isEmpty) {
      errorMessage = "Please select the tick box to continue";
    }

    return errorMessage;
  }

}
