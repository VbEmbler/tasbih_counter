import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasbih_counter/voids/show_alert_dhikr.dart';

class SaveButton extends StatelessWidget {
  final Function mySetState;
  final int counter;
  const SaveButton({
    Key? key,
    required this.counter,
    required this.mySetState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => showAlertDhikr(
            counter: counter,
            context: context,
            isEdit: false,
            mySetState: mySetState,
          ),
          child: SizedBox(
            height: 45,
            width: double.infinity,
            child: Center(
              child: Text(
                'Save dhikr'.tr(),
                style: const TextStyle(
                  color: Color(0xFF4664FF),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
