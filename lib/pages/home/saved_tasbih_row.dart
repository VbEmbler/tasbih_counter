import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasbih_counter/models/dhikr.dart';
import 'package:tasbih_counter/voids/show_alert_dhikr.dart';

class SavedTasbihRow extends StatelessWidget {
  final Function mySetState;
  final int index;
  const SavedTasbihRow(
    this.index, {
    super.key,
    required this.mySetState,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 45,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                fakeDB[index].counter.toString(),
                style: const TextStyle(
                  fontFamily: 'REM-Bold',
                  color: Color(0xFF4664FF),
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 2,
          height: 30,
          color: Colors.white,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              fakeDB[index].title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Text(
          DateFormat('dd.MM.yyyy').format(fakeDB[index].date),
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF9F9F9F),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: const Color(0xFFF9F9F9),
              child: InkWell(
                onTap: () {
                  showAlertDhikr(
                    counter: fakeDB[index].counter,
                    context: context,
                    isEdit: true,
                    title: fakeDB[index].title,
                    mySetState: mySetState,
                    index: index,
                  );
                },
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: Image.asset('assets/images/row_menu.png'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
