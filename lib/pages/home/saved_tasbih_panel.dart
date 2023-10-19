import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasbih_counter/models/dhikr.dart';
import 'package:tasbih_counter/pages/home/saved_tasbih_row.dart';

class SavedTasbihPanel extends StatelessWidget {

  const SavedTasbihPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last saved dhikrs'.tr(),
              style: const TextStyle(
                fontFamily: 'REM-Bold',
                color: Color(0xFF232323),
                fontSize: 14,
              ),
            ),
            Container(
              width: 60,
              height: 2,
              color: const Color(0xFF4664FF),
              margin: const EdgeInsets.only(top: 4, bottom: 20),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: fakeDB.length,
                  itemBuilder: (context, index) {
                    int newIndex = fakeDB.length - 1 - index;
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F9F9),
                      ),
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: SavedTasbihRow(
                        newIndex,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
