import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:party_pal2/peresentation/bloc/auth_bloc.dart';
import 'package:party_pal2/peresentation/pages/designers_page.dart';
import 'package:party_pal2/peresentation/pages/forgot_password_page.dart';
import 'package:party_pal2/peresentation/pages/home_page.dart';
import 'package:party_pal2/peresentation/pages/designer_profile_page.dart';
import 'package:party_pal2/peresentation/pages/sign_in_page.dart';
import 'package:party_pal2/peresentation/pages/sign_up_page.dart';
import 'core/constants/theme/app_localizations.dart';
import 'core/constants/theme/theme.dart';

Future<Map<String, dynamic>> loadLocalization(String langCode) async {
  String path = 'assets/localization/$langCode.json';
  String jsonString = await rootBundle.loadString(path);
  return jsonDecode(jsonString);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // مهم قبل أي async في main

  Map<String, dynamic> enData = await loadLocalization('en');
  print("English: $enData");

  Map<String, dynamic> arData = await loadLocalization('ar');
  print("Arabic: $arData");
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        supportedLocales: const [Locale('en'), Locale('ar')],
        localizationsDelegates:  [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: SignInPage.routeName,
        routes: {
          SignInPage.routeName : (context) => SignInPage(),
          SignUpPage.routeName : (context)=> SignUpPage(),
          ForgetPassWord.routeName : (context)=>ForgetPassWord(),
          DesignerProfilePage.routeName : (context)=>DesignerProfilePage(),
          HomePage.routeName : (context) => HomePage(),
          DesignersPage.routeName : (context) => DesignersPage()
        },
      ),
    );
  }
}