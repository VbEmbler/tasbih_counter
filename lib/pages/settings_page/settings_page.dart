import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF4664FF),
          title: const Text('Settings'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back'),
            ),
            TextButton(
              child: const Text('Перейти на CustomPage'),
              onPressed: () {
                /*MaterialPageRoute customPageRoute = MaterialPageRoute(builder: (BuildContext context) => const CustomPage());
                Navigator.push(context, customPageRoute);*/

                Navigator.pushNamed(context, '/customPage');
              }
            ),
          ],
        ),
      ),
    );
  }
}
