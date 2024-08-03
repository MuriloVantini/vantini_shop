import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vantini_shop/src/screens/auth/login.dart';

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    const Color lightPrimary = Color.fromRGBO(0, 255, 117, 1);
    const Color darkPrimary = Color.fromRGBO(25, 191, 103, 1);
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'pt-br'),
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,

          //LightTheme quando o tema do dispotivo é claro
          theme: ThemeData(
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                maximumSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, 40)),
                minimumSize: const WidgetStatePropertyAll(Size(150, 40)),
                fixedSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, 40)),
                iconColor: const WidgetStatePropertyAll(lightPrimary),
                backgroundColor: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected) ? darkPrimary : lightPrimary.withOpacity(0.08)),
                shadowColor: WidgetStatePropertyAll(darkPrimary.withGreen(255)),
                animationDuration: const Duration(milliseconds: 500),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                foregroundColor: const WidgetStatePropertyAll(lightPrimary),
                textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 16, decoration: TextDecoration.none)),
              ),
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(color: Colors.black, fontSize: 36, fontWeight: FontWeight.normal, decoration: TextDecoration.none),
              bodySmall: TextStyle(color: Colors.black38, fontSize: 14, fontWeight: FontWeight.normal, decoration: TextDecoration.none),
            ),
            primaryColor: lightPrimary,
            scaffoldBackgroundColor: Colors.white,
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: lightPrimary,
              onPrimary: Colors.white,
              secondary: Color.fromRGBO(13, 13, 14, 1),
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            inputDecorationTheme: InputDecorationTheme(
              prefixIconColor: lightPrimary.withGreen(150),
              hintFadeDuration: const Duration(milliseconds: 300),
              labelStyle: const TextStyle(color: Colors.black),
              hintStyle: TextStyle(color: Colors.grey[300]!),
              enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: lightPrimary, width: 1), borderRadius: BorderRadius.circular(12)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: lightPrimary)),
              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.red, width: 2)),
              disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
            ),
          ),

          //DarkTheme quando o tema do dispotivo é escuro
          darkTheme: ThemeData(
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                maximumSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, 40)),
                minimumSize: const WidgetStatePropertyAll(Size(150, 40)),
                fixedSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, 40)),
                iconColor: const WidgetStatePropertyAll(darkPrimary),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                backgroundColor: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected) ? darkPrimary : darkPrimary.withOpacity(0.15)),
                shadowColor: WidgetStatePropertyAll(darkPrimary.withGreen(255)),
                animationDuration: const Duration(milliseconds: 500),
                foregroundColor: const WidgetStatePropertyAll(lightPrimary),
                textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 16, decoration: TextDecoration.none)),
              ),
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.normal, decoration: TextDecoration.none),
              bodySmall: TextStyle(color: Colors.white38, fontSize: 14, fontWeight: FontWeight.normal, decoration: TextDecoration.none),
            ),
            primaryColor: darkPrimary,
            scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20),
            colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: darkPrimary,
              onPrimary: Colors.white,
              secondary: Color.fromRGBO(85, 85, 90, 1),
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
              surface: Color.fromARGB(255, 20, 20, 20),
              onSurface: Color.fromARGB(255, 225, 219, 219),
            ),
            inputDecorationTheme: InputDecorationTheme(
              prefixIconColor: darkPrimary.withGreen(96),
              hintFadeDuration: const Duration(milliseconds: 300),
              labelStyle: const TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.grey[300]!),
              enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: darkPrimary, width: 1), borderRadius: BorderRadius.circular(12)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: darkPrimary, width: 10)),
              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.red, width: 10)),
              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.red, width: 10)),
              disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
            ),
          ),
          themeMode: settingsController.themeMode,

          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  default:
                    return const LoginPage();
                }
              },
            );
          },
        );
      },
    );
  }
}
