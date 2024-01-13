import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/external_apps.dart';
import 'screens/firebase_realtime_db.dart';
import 'screens/flutter_mentions.dart';
import 'screens/flutter_quill.dart';
import 'screens/intl_phone_field_screen.dart';
import 'screens/showcaseview.dart';
import 'screens/table_calendar_screen.dart';
import 'screens/webview_flutter.dart';
import 'localizations/codegen_loader.dart';
import 'localizations/locale_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    fallbackLocale: const Locale('en'),
    assetLoader: const CodegenLoader(),
    path: 'assets/lang',
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Playground')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            child: Text(LocaleKeys.changeLang.tr()),
            onPressed: () {
              final locale = context.locale;
              if (locale.languageCode == 'en') {
                context.setLocale(const Locale('ar'));
              } else if (locale.languageCode == 'ar') {
                context.setLocale(const Locale('en'));
              }
            },
          ),
          ElevatedButton(
            child: const Text('External Apps Integration'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ExternalApps()),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Firebase Realtime DB'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const FirebaseRealtimeDB()),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Flutter Quill'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const FlutterQuill()),
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
          ElevatedButton(
            child: const Text('Intl Phone Field'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const IntlPhoneFieldScreen()),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Showcase View'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ShowCaseView()),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Table Calendar'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const TableCalendarScreen()),
              );
            },
          ),
          ElevatedButton(
            child: const Text('WebView Flutter'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const WebViewExample()),
              );
            },
          ),
        ],
      ),
    );
  }
}
