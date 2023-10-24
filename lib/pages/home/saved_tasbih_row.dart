import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasbih_counter/voids/show_alert_dhikr.dart';

class SavedTasbihRow extends StatelessWidget {
  final int index;
  final int counter;
  final String title;
  final DateTime date;
  const SavedTasbihRow({
    super.key,
    required this.index,
    required this.counter, required this.title, required this.date,
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
                counter.toString(),
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
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Text(
          DateFormat('dd.MM.yyyy').format(date),
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
                    counter: counter,
                    context: context,
                    isEdit: true,
                    title: title,
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
