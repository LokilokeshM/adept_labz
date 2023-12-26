// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'color_config.dart';

Color primary = Color(HexColor.getColorFromHex("#6A67F3"));
const Color secondary = Color(0xFF2B2B2B);
Color primaryLight = Colors.grey.shade300;
const Color white = Color(0xFFFFFFFF);
const Color black = Color(0xFF000000);
const Color yellowStar = Color(0xFFfacb00);
const online = Color(0xFF66BB6A);
const blueStory = Colors.blueAccent;
const kAccentColor = Color(0xFFF1F1F1);
Color kWhiteColor = Color(HexColor.getColorFromHex("#FFFFFF"));
const kLightColor = Color(0xFF808080);
const kDarkColor = Color(0xFF303030);
const kTransparent = Colors.transparent;
const primaryChat = Colors.green;
const red = Colors.red;
const grey = Color.fromARGB(255, 204, 204, 206);
const kDefaultPadding = 24.0;
const kLessPadding = 10.0;
const kFixPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
const kLess = 4.0;
Color violet = Color(HexColor.getColorFromHex("#6F00FF"));
Color lightViolet = Color(HexColor.getColorFromHex("#F0E5FF"));
Color lightGreen = Color(HexColor.getColorFromHex("#00DA57"));
const kShape = 30.0;

const kRadius = 0.0;
const kAppBarHeight = 56.0;

Color textFieldColor = Colors.grey.withOpacity(0.15);
TextStyle customParagraph =
    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
TextStyle customContent =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

TextStyle customTitle =
    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, height: 1.3);
const kHeadTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
);

final kTitleStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  height: 1.5,
);

final kSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.2,
);
const kSubTextStyle = TextStyle(
  fontSize: 18.0,
  color: kLightColor,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20.0,
);

const kDarkTextStyle = TextStyle(
  fontSize: 20.0,
  color: kDarkColor,
);

const kDivider = Divider(
  color: kAccentColor,
  thickness: kLessPadding,
);

const kSmallDivider = Divider(
  color: kAccentColor,
  thickness: 5.0,
);

const double BOTTOM_SHEET_PERCENT_60 = 0.60;
const double BOTTOM_SHEET_PERCENT_50 = 0.50;
const double BOTTOM_SHEET_PERCENT_35 = 0.35;
const double BOTTOM_SHEET_PERCENT_30 = 0.30;
const double BOTTOM_SHEET_PERCENT_90 = 0.90;
const double FULL_BOTTOM_SHEET_PERCENT = 0.95;
const double BOTTOM_SHEET_PERCENT_65 = 0.65;

double CARD_RADIUS = 16.r;
double CARD_RADIUS_SMALL = 8.r;
double CARD_RADIUS_LARGE = 20.r;
double MIN_BUTTON_WIDTH = 192.w;
double MIN_BUTTON_HEIGHT = 46.h;

// Use if the page has appbar
double IMAGE_TOP_MARGIN_WITH_APPBAR = .05.sh;

// Use if the page doesn't have appbar
double IMAGE_TOP_MARGIN_WITHOUT_APPBAR =
    IMAGE_TOP_MARGIN_WITH_APPBAR + kToolbarHeight;

double VEHICLE_IMAGE_HEIGHT = .25.sh;

const double MIN_TEMP_21MM_F = 58.0;
const double MAX_TEMP_21MM_F = 90.0;
const double MIN_TEMP_F = 65.0;
const double MAX_TEMP_F = 85.0;
const double MIN_TEMP_C = 18.0;
const double MAX_TEMP_C = 29.0;
const double MID_TEMP_C = 23.5; //23.5
const double MID_TEMP_F = 75.0; //75.0
const int MID_TEMP_C_DIVISION = 1; //23.5
const int MID_TEMP_F_DIVISION = 1; //75.0
const String ZERO_PERCENT = "0%";

const int DEVICE_HEIGHT = 812;
const int DEVICE_WIDTH = 375;
const String mmmmDyyyy = 'MMM d, yyyy';
Widget heightSpace({double height = 10}) => SizedBox(
      height: height,
    );
