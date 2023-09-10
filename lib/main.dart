import 'package:flutter/material.dart';
import 'package:tasbih_counter/pages/custom_page/custom_page.dart';
import 'package:tasbih_counter/pages/home/home_page.dart';
import 'package:flutter/services.dart';
import 'package:tasbih_counter/pages/settings_page/settings_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );

  runApp(const TasbihCounter());
}

class TasbihCounter extends StatelessWidget {
  const TasbihCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomePage(),
        '/settingsPage': (context) => const SettingsPage(),
        '/customPage': (context) => const CustomPage()
      },
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
