import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasbih_counter/providers/counter_provider.dart';
import 'package:tasbih_counter/voids/show_alert_dhikr.dart';

class SaveButton extends StatelessWidget {

  const SaveButton({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => showAlertDhikr(
            context: context,
            isEdit: false, counter: context.read<CounterProvider>().tasbihCount,
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
