import 'package:flutter/material.dart';

const kBackgroundColour = Color(0xFF111328);
const kInactiveCardColour = Color(0xFF1D1E33);
const kActiveCardColour = Color(0xFF2e2f4a);
const kContainerColour = Color(0xFF097479);
const String kGetUrl =
    'http://10.160.21.163:8086/query?pretty=true&db=antares&q=SELECT%20*%20FROM%20data%20ORDER%20BY%20time%20DESC%20LIMIT%201%20tz(%27Asia%2FJakarta%27)';
const String kSendUrl =
    'https://platform.antares.id:8443/~/antares-cse/antares-id/FIKR_WORKSHOP_DAY1/MQTT';
const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  color: Colors.white,
  fontWeight: FontWeight.w900,
);

const kInputStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

const kDateTitleTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
  fontWeight: FontWeight.w900,
);

const kDateTextStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.white,
  fontWeight: FontWeight.w900,
);

const kTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);
