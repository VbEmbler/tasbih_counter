import 'package:flutter/material.dart';

class TogglePanel extends StatelessWidget {
  final bool isActivity;
  final Function toggleActivity;
  const TogglePanel(
      this.isActivity,
      this.toggleActivity,
      {super.key}
      );

  @override
  Widget build(BuildContext context) {
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
                      if (!isActivity) toggleActivity();
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                        isActivity ? const Color(0xFF4664FF) : Colors.white,
                      ),
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(4),
                      child: Text(
                        'Activity',
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
                      if (isActivity) toggleActivity();
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                        isActivity ? Colors.white : const Color(0xFF4664FF),
                      ),
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(4),
                      child: Text(
                        'Saved',
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
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                //MaterialPageRoute settingsPageRoute = MaterialPageRoute(builder: (BuildContext context) => const SettingsPage());
                //Navigator.push(context, settingsPageRoute);

                Navigator.pushNamed(context, '/settingsPage');
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
        ),
      ],
    );
  }
}
