import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasbih_counter/pages/custom_page/custom_page.dart';
import 'package:tasbih_counter/pages/home/home_page.dart';
import 'package:flutter/services.dart';
import 'package:tasbih_counter/pages/settings_page/settings_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const TasbihCounter());
}

class TasbihCounter extends StatelessWidget {
  const TasbihCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
      //home: const HomePage(),
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
