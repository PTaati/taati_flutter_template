import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taati_flutter_template/localizations/language_localization.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Widget _buildHome() {
    return SafeArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(child: Text(context.strings.greetingMessage)),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LanguageLocalization(
      builder: (context, locale) {
        return MaterialApp(
          theme: ThemeData(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale,
          home: _buildHome(),
        );
      },
    );
  }
}
