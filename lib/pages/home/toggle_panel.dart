import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tasbih_counter/providers/toggle_panel_provider.dart';

class TogglePanel extends StatelessWidget {
  const TogglePanel({super.key});

  @override
  Widget build(BuildContext context) {
    final panelProvider = context.watch<TogglePanelProvider>();
    bool isActivity = panelProvider.isActivity;
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (!isActivity) {
                        panelProvider.toggleActivity();
                      }
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isActivity
                            ? const Color(0xFF4664FF)
                            : Colors.white,
                      ),
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(4),
                      child: Text(
                        'Activity'.tr(),
                        style: TextStyle(
                          color: isActivity
                              ? Colors.white
                              : const Color(0xFF9E9E9E),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (isActivity) {
                        panelProvider.toggleActivity();
                      }
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isActivity
                            ? Colors.white
                            : const Color(0xFF4664FF),
                      ),
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(4),
                      child: Text(
                        'Saved'.tr(),
                        style: TextStyle(
                          color: isActivity
                              ? const Color(0xFF9E9E9E)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const ButtonsGoSettings(),
      ],
    );
  }
}

class ButtonsGoSettings extends StatelessWidget {
  const ButtonsGoSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            //MaterialPageRoute settingsPageRoute = MaterialPageRoute(builder: (BuildContext context) => const SettingsPage());
            //Navigator.push(context, settingsPageRoute);

            //Navigator.pushNamed(context, '/settingsPage');
            context.go('/settingsPage');
          },
          child: SizedBox(
            width: 54,
            height: 38,
            child: Image.asset(
              'assets/images/menu.png',
            ),
          ),
        ),
      ),
    );
  }
}
