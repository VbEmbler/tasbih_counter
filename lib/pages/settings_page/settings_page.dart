import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasbih_counter/voids/show_alert_dhikr.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4664FF),
        title: Text('Settings'.tr()),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: TextButton(
                child: const Text('Перейти на CustomPage'),
                onPressed: () {
                  /*MaterialPageRoute customPageRoute = MaterialPageRoute(builder: (BuildContext context) => const CustomPage());
                  Navigator.push(context, customPageRoute);*/
            
                  //Navigator.pushNamed(context, '/customPage');
                  context.go('/settingsPage/customPage');
                },
              ),
            ),
                        ListTile(
              title: TextButton(
                child: const Text('Перейти на ToDo Page'),
                onPressed: () {
                  /*MaterialPageRoute customPageRoute = MaterialPageRoute(builder: (BuildContext context) => const CustomPage());
                  Navigator.push(context, customPageRoute);*/

                  //Navigator.pushNamed(context, '/customPage');
                  context.go('/settingsPage/todoPage');
                },
              ),
            ),
            ListTile(
              tileColor: Colors.black12,
              leading: const Icon(Icons.language),
              title: Text('Language:'.tr()),
              trailing: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const EditLangs();
                    },
                  );
                },
                child: Text(myLangs[context.locale.toString()].toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
