import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'vi.dart';
import 'en.dart';


class TranslationService extends Translations {
  static Locale? get deviceLocale => //Locale('vi', 'VN');
      Locale(Get.deviceLocale?.languageCode ?? "vi");

  static String getLanguage(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'vi':
      default:
        return 'Tiếng Viêt';
    }
  }

  static List<Locale> supportedLocales = [
    Locale("vi"),
    Locale("en"),
  ];
  static final fallbackLocale = Locale("vi");

  static List<String> listLanguageCodes() {
    List<String> list = [];
    for (Locale locale in supportedLocales) {
      list.add(locale.languageCode);
    }
    return list;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        "vi": vietnamese,
        "en": english,
      };
}
