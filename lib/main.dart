import 'package:flutter/material.dart';
import 'package:tasbih_counter/pages/home/home_page.dart';
import 'package:flutter/services.dart';

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
      title: 'Tasbih Counter',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'REM-Medium',
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
          fontSize: 12,
        )),
      ),
      home: const HomePage(),
    );
  }
}
