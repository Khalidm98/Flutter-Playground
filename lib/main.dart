import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'screens/external_apps.dart';
import 'screens/flutter_mentions.dart';
import 'screens/flutter_quill.dart';
import 'localizations/codegen_loader.dart';
import 'localizations/locale_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('ar')],
    fallbackLocale: Locale('en'),
    assetLoader: CodegenLoader(),
    path: 'assets/lang',
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playground',
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Playground')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            child: Text(LocaleKeys.change_lang.tr()),
            onPressed: () {
              final locale = context.locale;
              if (locale.languageCode == 'en')
                context.setLocale(Locale('ar'));
              else if (locale.languageCode == 'ar')
                context.setLocale(Locale('en'));
            },
          ),
          ElevatedButton(
            child: const Text('External Apps Integration'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ExternalApps()),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Flutter Quill'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => FlutterQuill()),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Flutter Mentions'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => FlutterMentionsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
