import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dimens.dart';

final largeStyleProvider = Provider<TextStyle>((ref) => GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: ref.watch(largeDimenProvider), color: Colors.black, letterSpacing: 2.0)));

final mediumStyleProvider = Provider<TextStyle>((ref) => GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: ref.watch(mediumDimenProvider), color: Colors.black,  letterSpacing: 2.0)));

final normalStyleProvider = Provider<TextStyle>((ref) => GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: ref.watch(normalDimenProvider), color: Colors.black,  letterSpacing: 2.0)));

final smallStyleProvider = Provider<TextStyle>((ref) => GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: ref.watch(smallDimenProvider), color: Colors.black,  letterSpacing: 2.0)));

final miniStyleProvider = Provider<TextStyle>((ref) => GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: ref.watch(miniDimenProvider), color: Colors.black,  letterSpacing: 2.0)));
