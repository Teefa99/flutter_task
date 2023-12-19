import 'package:task/config/ConfigReader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('ar', 'EG');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': ConfigReader.configEN!,
        'ar_EG': ConfigReader.configAR!,
      };
}
