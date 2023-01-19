import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String google_api_key = "AIzaSyBsbRwgqiOqPTRdoyrWzXPidCz8itprLds";

const Color whiteColor = Color(0xFFFFFFFF);
const Color primaryColor = Color(0xFF82954B);
const Color blackColor = Color(0xFF000000);

const FontWeight normal = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;

const double defaultPadding = 16.0;

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: bold,
    letterSpacing: -1.5,
  ),
  headline2: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: semiBold,
    letterSpacing: -1.5,
  ),
  bodyText1: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: semiBold,
    letterSpacing: -0.5,
  ),
  button: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: semiBold,
    letterSpacing: -0.5,
  ),
);

TextStyle heading1 = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: bold,
  letterSpacing: -1.5,
  color: primaryColor,
);
TextStyle heading2 = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: semiBold,
  letterSpacing: -1.5,
);
TextStyle body = GoogleFonts.poppins(
  fontSize: 12,
  fontWeight: semiBold,
  letterSpacing: -0.5,
);
