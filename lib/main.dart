import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tasbih_counter/models/dhikr.dart';
import 'package:tasbih_counter/pages/custom_page/custom_page.dart';
import 'package:tasbih_counter/pages/home/home_page.dart';
import 'package:flutter/services.dart';
import 'package:tasbih_counter/pages/settings_page/settings_page.dart';
import 'package:tasbih_counter/providers/counter_provider.dart';
import 'package:tasbih_counter/providers/hive_provider.dart';
import 'package:tasbih_counter/providers/toggle_panel_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(DhikrAdapter());

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => TogglePanelProvider()),
        ChangeNotifierProvider(create: (context) => HiveProvider(), lazy: false,),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
        ],
        assetLoader: CsvAssetLoader(),
        fallbackLocale: const Locale('en'),
        path: 'assets/langs/langs.csv',
        // ignore: prefer_const_constructors
        child: TasbihCounter(),
      ),
    ),
  );
}

class TasbihCounter extends StatelessWidget {
  const TasbihCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: ValueKey(context.locale),
      child: MaterialApp.router(
        routerConfig: _router,
        title: 'Tasbih Counter',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'REM-Medium',
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
            fontSize: 12,
          )),
        ),
        // На 25 минуте
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        //home: const HomePage(),
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: 'settingsPage',
          builder: (BuildContext context, GoRouterState state) {
            return const SettingsPage();
          },
          routes: [
            GoRoute(
              path: 'customPage',
              builder: (BuildContext context, GoRouterState state) {
                return const CustomPage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
