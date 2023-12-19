import 'dart:convert';

import 'package:flutter/services.dart';
abstract class ConfigReader{
  static Map<String , String>? configAR;
  static Map<String , String>? configEN;
  static Future<void> initialize() async {
    final responseStringAR = await rootBundle.loadString("assets/locale_ar.json");
    final responseStringEN = await rootBundle.loadString("assets/locale_en.json");
    configAR=   Map<String,String>.from(json.decode(responseStringAR));
    configEN=   Map<String,String>.from(json.decode(responseStringEN));
  }
}