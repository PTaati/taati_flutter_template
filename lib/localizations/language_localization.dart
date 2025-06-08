import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

extension LanguageLocalizationBuildContext on BuildContext {
  AppLocalizations get strings {
    return AppLocalizations.of(this)!;
  }
}

class LanguageLocalization extends StatefulWidget {
  const LanguageLocalization({required this.builder, super.key});

  final Widget Function(BuildContext context, Locale locale) builder;

  @override
  State<LanguageLocalization> createState() => _LanguageLocalizationState();
}

class _LanguageLocalizationState extends State<LanguageLocalization> {
  late LanguageNotifier _languageNotifier;

  @override
  void initState() {
    super.initState();

    _languageNotifier = LanguageNotifier(language: Language.th);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _languageNotifier,
      child: Builder(
        builder: (context) {
          final languageNotifier = context.watch<LanguageNotifier>();

          return widget.builder(context, languageNotifier.language.locale);
        },
      ),
    );
  }
}

/// Update value follow by lib/l10n
enum Language {
  th;

  Locale get locale => Locale(Language.th.name);
}

class LanguageNotifier extends ChangeNotifier {
  LanguageNotifier({required this.language});

  Language language;

  void setLanguage(Language language) {
    language = language;

    notifyListeners();
  }
}
