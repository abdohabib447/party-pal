import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);


  late Map<String, String> _localizedStrings;


  Future<void> load() async {
    final jsonString = await rootBundle
        .loadString('assets/localization/${locale.languageCode}.json');


    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((k, v) => MapEntry(k, v.toString()));
  }


  String translate(String key) => _localizedStrings[key] ?? key;


  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}


class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();


  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);


  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }


  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;
}